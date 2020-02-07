# This class will parse log line.
class LogLine
  attr_accessor :ip, :url

  def initialize(ip = nil, url = nil)
    @ip = ip
    @url = url
  end

  def parse_log_line(log_line)
    @url, @ip = log_line.first.split(' ')
  end
  end
