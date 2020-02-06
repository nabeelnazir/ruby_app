class LogsParser
  PAGE = %r{(?<path>[a-zA-Z0-9\/_-]*)}.freeze # page rejex. for example '/home/1'
  IP = /(?<ip>([0-9]{1,3}\.){3}([0-9]{1,3}){1})/.freeze # IP rejex.

  def initialize(logfile_path)
    @logfile_path = logfile_path
    validate_file # check file exists and it should not be empty.
    @logs = {}
  end

  def parse_logs
    file = open @logfile_path
    file.each do |line|
      data = line.split(' ')
      page = data.first
      ip = data.last
      unless validate_log_entry(page, ip)
        invalid_log_entry(line)
      end # chek if log entry is valid.
      @logs[page] ? @logs[page] << ip : @logs[page] = [ip]
    end
    @logs
  end

  private

  def validate_file
    unless File.exist?(@logfile_path)
      raise "No such file or directory @ #{@logfile_path}"
    end
    raise 'File is empty' if File.zero?(@logfile_path)
  end

  # check if IP and Page url ('/home/1') is valid.
  def validate_log_entry(page, ip)
    !!(IP =~ ip) && !!(PAGE =~ page)
  end

  def invalid_log_entry(line)
    raise "Log entry is invalid: #{line}"
  end
end
