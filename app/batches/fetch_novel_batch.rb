class FetchNovelBatch
  def self.run
    client = NcodeSyosetu::Client.new
    Novel.all.find_each do |novel|
      novel.fetch_novel!(client)
    end
  end
end
