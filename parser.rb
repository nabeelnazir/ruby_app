require_relative 'lib/logs_parser.rb'
require_relative 'lib/logs_view.rb'
require_relative 'lib/logs_validation.rb'
require_relative 'lib/log_line.rb'
require 'table_print'
require 'optparse'

############################# OptionParser ##############################
options = {}

optparse = OptionParser.new do |opts|
  opts.on('-f', '--file_path FILENAME', 'Mandatory File Path') do |f|
    options[:file_path] = f
  end
end

optparse.parse!

############################# OptionParser ##############################

log_line = LogLine.new
logs_validation = LogsValidation.new(options[:file_path])
logs = LogsParser.new(logs_validation, log_line).parse_logs
logs_view = LogsView.new(logs)

puts
puts 'MOST VIEWS:'
puts
tp [logs_view.most_views]

puts
puts 'UNIQUE VIEWS:'
puts
tp [logs_view.unique_views]
