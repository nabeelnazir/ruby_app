require_relative '../../lib/logs_parser.rb'
require 'pry'
RSpec.describe LogsParser do
  let(:logfile_path) { 'spec/fixtures/webserver_sample.log' }
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
      let(:expected_results) do
        {
          "/help_page/1"=>["126.318.035.038", "929.398.951.889", "722.247.931.582"],
          "/contact"=>["184.123.665.067"],
          "/home"=>["184.123.665.067"],
          "/about/2"=>["444.701.448.104"],
          "/index"=>["444.701.448.104"],
          "/about"=>["061.945.150.735"]
        }
      end
      it 'should produce a hash of page urls and ip_addresses' do
        logs = logs_parser.parse_logs
        expect(logs).to eq(expected_results)
      end
    end
  end
end
