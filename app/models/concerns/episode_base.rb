require "digest"

module EpisodeBase
  extend ActiveSupport::Concern

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}/#{number}"
  end

  def mp3_path
    title_digest = Digest::MD5.hexdigest(title)
    "#{ncode}/#{number}-#{title_digest}.mp3"
  end
end
