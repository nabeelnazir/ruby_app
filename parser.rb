require_relative 'lib/logs_parser.rb'
require_relative 'lib/logs_view.rb'
require 'table_print'

logs = LogsParser.new(ARGV[0]).parse_logs
logs_view = LogsView.new(logs)

puts
puts 'MOST VIEWS:'
puts
tp [logs_view.most_views]

puts
puts 'UNIQUE VIEWS:'
puts
tp [logs_view.unique_views]
