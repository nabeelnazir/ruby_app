require_relative '../../lib/log_line.rb'

RSpec.describe LogLine do
  subject(:log_line) { LogLine.new }

  describe '#parse_log_line' do
    context 'when parse log lien called' do
      it 'should return url and ip' do
        line = ['/index 10.112.22.300']
        expected_url = '/index'
        expected_ip = '10.112.22.300'
        url, ip = log_line.parse_log_line line
        expect(url).to eq(expected_url)
        expect(ip).to eq(expected_ip)
      end
    end
  end
end
