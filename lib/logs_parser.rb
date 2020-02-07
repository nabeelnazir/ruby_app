require_relative './logs_validation.rb'
require 'csv'

# This class will get a logs file and parse the logs.
class LogsParser
  def initialize(logfile_path)
    @logfile_path = logfile_path
    @logs_validation = LogsValidation.new(logfile_path)
    @logs_validation.validate_file
    @logs = {}
  end

  def parse_logs
    CSV.foreach(@logfile_path) do |line|
      url, ip = line.first.split(' ')
      # chek if log entry is valid.
      unless @logs_validation.validate_log_entry(url, ip)
        @logs_validation.invalid_log_entry(line)
      end
      @logs[url] ? @logs[url] << ip : @logs[url] = [ip]
    end
    @logs
  end
end
