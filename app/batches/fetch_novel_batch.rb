class FetchNovelBatch < BatchBase
  DEFAULT_SLEEP_SECOND = 1

  def self.run
    client = NcodeSyosetu::Client.new(logger: logger)
    Novel.all.find_each do |novel|
      novel.fetch_novel!(client)
      sleep(DEFAULT_SLEEP_SECOND)
    end
  end
end
