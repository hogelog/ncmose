class ArchivedEpisode < ApplicationRecord
  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}/#{number}"
  end
end
