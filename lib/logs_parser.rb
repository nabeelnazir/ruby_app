require_relative './logs_validation.rb'
require_relative './log_line.rb'
require 'csv'

# This class will get a logs file and parse the logs.
class LogsParser
  def initialize(logs_validation, log_line)
    @logs_validation = logs_validation
    @logfile_path = @logs_validation.validate_file
    @log_line = log_line
    @logs = {}
  end

  def parse_logs
    CSV.foreach(@logfile_path) do |line|
      @log_line.parse_log_line(line)
      url = @log_line.url
      ip = @log_line.ip
      # chek if log entry is valid.
      unless @logs_validation.validate_log_entry(url, ip)
        @logs_validation.invalid_log_entry(line)
      end
      @logs[url] ? @logs[url] << @log_line.ip : @logs[url] = [ip]
    end
    @logs
  end
end
