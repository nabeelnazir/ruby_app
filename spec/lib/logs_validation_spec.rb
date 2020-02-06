require_relative '../../lib/logs_validation.rb'

RSpec.describe LogsValidation do
  let(:logfile_path) { 'spec/fixtures/webserver_sample.log' }
  subject(:logs_validation) { described_class.new(logfile_path) }

  describe '#validate_file' do
    context 'with empty file' do
      let(:logfile_path) { '' }
      it 'raises an error' do
        expect { logs_validation.validate_file }.to raise_error(RuntimeError, "No such file or directory @ #{logfile_path}")
      end
    end
    
    context 'with correct file' do
        it 'returns file path' do
          expect(logs_validation.validate_file).to eq('spec/fixtures/webserver_sample.log')
        end
    end
  end

  describe '#validate_log_entry' do
    context 'with incorrect IP and correct page' do
      it 'returns false' do
        expect(logs_validation.validate_log_entry('/first/1', '100')).to eq(false)
      end
    end
    context 'with correct IP and correct page' do
        it 'returns true' do
          expect(logs_validation.validate_log_entry('/first/1', '100.100.12.123')).to eq(true)
        end
    end
  end

  describe '#invalid_log_entry' do
    context 'with incorrect IP and correct page' do
      let(:logfile_path) { 'spec/fixtures/invalid_webserver.log' }
      it 'raises an error' do
        invalid_entry = File.read(logfile_path)
        expect { logs_validation.invalid_log_entry(invalid_entry) }.to raise_error(RuntimeError, "Log entry is invalid: #{invalid_entry}")
      end
    end
  end

end
