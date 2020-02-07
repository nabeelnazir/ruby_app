require_relative '../../lib/logs_parser.rb'
require_relative '../../lib/logs_validation.rb'
RSpec.describe LogsParser do
  let(:logfile_path) { 'spec/fixtures/webserver_sample.log' }
  let(:logs_validation) { LogsValidation.new(logfile_path) }
  let(:log_line) { LogLine.new }
  subject(:logs_parser) { described_class.new(logs_validation, log_line) }

  describe '#new' do
    context 'with empty file' do
      let(:logfile_path) { '' }
      it 'raises an error' do
        expect { logs_parser }.to raise_error(RuntimeError, "No such file or directory @ #{logfile_path}")
      end
    end
  end

  describe '#parse_logs' do
    context 'when log contains invalid entry' do
      let(:logfile_path) { 'spec/fixtures/invalid_webserver.log' }
      it 'raises an error' do
        invalid_entry = File.read(logfile_path)
        expect { logs_parser.parse_logs }.to raise_error(RuntimeError, "Log entry is invalid: #{invalid_entry}")
      end
    end
    context 'when initialized with a correct file along with a correct log entry' do
      let(:expected_results) do
        {
          '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582'],
          '/contact' => ['184.123.665.067'],
          '/home' => ['184.123.665.067'],
          '/about/2' => ['444.701.448.104'],
          '/index' => ['444.701.448.104'],
          '/about' => ['061.945.150.735']
        }
      end
      it 'should produce a hash of page urls and ip_addresses' do
        logs = logs_parser.parse_logs
        expect(logs).to eq(expected_results)
      end
    end
  end
end
