class BatchBase
  def self.execute
    run
  rescue => e
    logger.error("#{e.message}\n#{e.backtrace.join("\n")}")
  end

  def self.logger
    @_logger ||= Logger.new(STDOUT)
  end
end
