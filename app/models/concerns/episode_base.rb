require "digest"

module EpisodeBase
  extend ActiveSupport::Concern

  def published_at
    @published_at ||= %r((\d+)/(\d+)/(\d+)) =~ title && Date.new($1.to_i, $2.to_i, $3.to_i)
  end

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}/#{number}"
  end

  def mp3_path
    title_digest = Digest::MD5.hexdigest(title)
    "#{ncode}/#{number}-#{title_digest}.mp3"
  end

  def mp3_download_url
    "#{ENV["MP3_DOWNLOAD_PREFIX"]}#{mp3_path}"
  end

  def s3_path
    "#{ENV["MP3_S3_PREFIX"]}#{mp3_path}"
  end

  def s3_url
    "s3://#{ENV["MP3_S3_BUCKET"]}/#{s4_path}"
  end
end
