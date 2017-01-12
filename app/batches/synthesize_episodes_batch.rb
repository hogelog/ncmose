class SynthesizeEpisodesBatch < BatchBase
  DEFAULT_SLEEP_SECOND = 2

  def self.run
    client = NcodeSyosetu::Client.new(logger: logger, sleep: DEFAULT_SLEEP_SECOND)
    polly = NcodeSyosetu::Builder::Polly.new(logger: logger)

    Novel.includes(:episodes).find_each do |novel|
      novel.episodes.unsynthesized.each do |episode|
        fetched_episode = client.get_episode(novel.ncode, episode.title, episode.number)
        polly.write_episode(fetched_episode, File.join(Rails.root, "tmp", episode.mp3_path))
        episode.update!(synthesized: true)
      end
    end
  end
end
