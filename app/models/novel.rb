class Novel < ApplicationRecord
  has_many :episodes

  before_destroy :archive_episodes!

  def link_title
    "#{title} (#{ncode_syosetu_url})"
  end

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}"
  end

  def fetch_novel!(client)
    toc = client.get_toc(ncode)

    transaction do
      update!(title: toc.title) if title != toc.title

      new_episodes = toc.episodes.select {|episode| episode[:number] }
      episodes.each do |episode|
        existing_episodes = new_episodes.reject! {|new_episode| episode.title == new_episode[:text] && episode.number == new_episode[:number] }
        if existing_episodes.empty?
          episode.archive!
        end
      end
      new_episodes.each do |new_episode|
        episodes.create!(number: new_episode[:number], title: new_episode[:text])
      end
    end
  end

  def archive_episodes!
    episodes.each do |episode|
      episode.archive!
    end
  end
end
