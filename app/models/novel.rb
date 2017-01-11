class Novel < ApplicationRecord
  has_many :episodes, dependent: :destroy

  def link_title
    "#{title} (#{ncode_syosetu_url})"
  end

  def ncode_syosetu_url
    "http://ncode.syosetu.com/#{ncode}"
  end

  def fetch_novel!(client)
    toc = client.get_toc(ncode)

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

  def archive!
    destroy!
  end
end
