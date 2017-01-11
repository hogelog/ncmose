class Episode < ApplicationRecord
  belongs_to :novel

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}/#{number}"
  end
end
