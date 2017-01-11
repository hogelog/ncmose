class Episode < ApplicationRecord
  belongs_to :novel

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{novel.ncode}/#{number}"
  end
end
