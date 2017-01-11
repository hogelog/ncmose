class Novel < ApplicationRecord
  def link_title
    "#{title} (#{ncode_syosetu_url})"
  end

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}"
  end
end
