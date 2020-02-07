require_relative '../../lib/logs_parser.rb'
require_relative '../../lib/logs_view.rb'
require_relative '../../lib/logs_validation.rb'
RSpec.describe 'Parser' do
  let(:logfile_path) { 'webserver.log' }
  let(:logs_validation) { LogsValidation.new(logfile_path) }
  let(:log_line) { LogLine.new }
  let(:logs) { LogsParser.new(logs_validation, log_line).parse_logs }
  let(:logs_view) { LogsView.new(logs) }

  describe 'Parser' do
    context 'when parses the logs file' do
      let(:most_views) do
        { '/about/2' => 90, '/contact' => 89, '/index' => 82, '/about' => 81, '/help_page/1' => 80, '/home' => 78 }
      end
      let(:unique_views) do
        { '/index' => 23, '/home' => 23, '/contact' => 23, '/help_page/1' => 23, '/about/2' => 22, '/about' => 21 }
      end
      it 'parses the file correctly and return the views' do
        expect(logs_view.most_views).to eq(most_views)
        expect(logs_view.unique_views).to eq(unique_views)
      end
    end
  end
end
