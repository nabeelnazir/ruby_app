require_relative './logs_validation.rb'
class LogsParser
  
  def initialize(logfile_path)
    @logfile_path = logfile_path
    @logs_validation = LogsValidation.new(logfile_path)
    @logs_validation.validate_file
    @logs = {}
  end

  def parse_logs
    file = open @logfile_path
    file.each do |line|
      data = line.split(' ')
      page = data.first
      ip = data.last
      unless @logs_validation.validate_log_entry(page, ip)
        @logs_validation.invalid_log_entry(line)
      end # chek if log entry is valid.
      @logs[page] ? @logs[page] << ip : @logs[page] = [ip]
    end
    @logs
  end

end
