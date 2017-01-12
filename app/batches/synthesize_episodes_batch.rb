class SynthesizeEpisodesBatch < BatchBase
  DEFAULT_SLEEP_SECOND = 2

  def self.run
    @mp3_s3_bucket = ENV["MP3_S3_BUCKET"] or abort("Undefined MP3_S3_BUCKET")
    @mp3_s3_prefix = ENV["MP3_S3_PREFIX"] || ""

    @syosetu = NcodeSyosetu::Client.new(logger: logger, sleep: DEFAULT_SLEEP_SECOND)
    @polly = NcodeSyosetu::Builder::Polly.new(logger: logger)
    @s3 = Aws::S3::Client.new

    Novel.includes(:episodes).find_each do |novel|
      novel.episodes.unsynthesized.order(:number).each do |episode|
        logger.info("Synthesize #{novel.title} (#{novel.ncode}) #{episode.number}...")
        fetched_episode = @syosetu.get_episode(novel.ncode, episode.title, episode.number)
        upload_mp3!(novel, episode, fetched_episode)
      end
    end
  rescue => e
    logger.error("#{e.message}\n#{e.backtrace.join("\n")}")
  end

  def self.upload_mp3!(novel, episode, fetched_episode)
    Tempfile.open(["ncode-#{novel.ncode}-#{episode.number}", ".mp3"]) do |tempfile|
      @polly.write_episode(fetched_episode, tempfile.path)
      logger.info("Uploading #{episode.s3_path}...")
      File.open(tempfile.path, "rb") do |file|
        @s3.put_object(
          region: @mp3_s3_region,
          bucket: @mp3_s3_bucket,
          body: file,
          key: episode.s3_path,
        )
      end
      episode.update!(synthesized: true, length: File.size(tempfile.path))
    end
  end
end
