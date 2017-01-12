class BatchBase
  def self.logger
    @_logger ||= Logger.new(STDOUT)
  end
end
