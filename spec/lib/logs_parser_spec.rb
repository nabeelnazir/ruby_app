require_relative '../../lib/logs_parser.rb'

RSpec.describe LogsParser do
  let(:logfile_path) { 'webserver.log' }
  subject(:logs_parser) { described_class.new(logfile_path) }

  describe '#new' do
    context 'with empty file' do
      let(:logfile_path) { '' }
      it 'raises an error' do
        expect { logs_parser }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#parse_logs' do
    context 'when log contains invalid entry' do
      let(:logfile_path) { 'spec/fixtures/invalid_webserver.log' }
      it 'raises an error' do
        expect { logs_parser.parse_logs }.to raise_error(RuntimeError)
      end
    end
    context 'when initialized with a correct file along with a correct log entry' do
      it 'should produce a hash of page urls and ip_addresses' do
        logs = logs_parser.parse_logs
        expect(logs.length).to eq(6)
        expect(logs.first.last.length).to eq(80)
      end
    end
  end
end
