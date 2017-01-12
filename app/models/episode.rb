class Episode < ApplicationRecord
  belongs_to :novel

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{novel.ncode}/#{number}"
  end

  def archive!
    transaction do
      ArchivedEpisode.create!(
        ncode: novel.ncode,
        number: number,
        title: title,
      )
      destroy!
    end
  end
end
