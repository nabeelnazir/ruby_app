require 'logs_parser.rb'
require 'logs_view.rb'

RSpec.describe LogsView do
  let(:logs) do
    {
      '/index' => ['444.701.448.105', '317.433.849.805', '801.682.923.781', '184.123.665.067', '444.701.448.105'],
      '/about' => ['126.318.035.038', '126.318.035.038'],
      '/home' => ['382.335.626.855', '801.682.923.781', '451.106.204.921', '715.156.286.412', '126.318.035.038']
    }
  end
  subject(:logs_view) { described_class.new(logs) }

  describe '#most_views' do
    let(:expected_results) do
      { '/home' => 5, '/index' => 5, '/about' => 2 }
    end
    context 'when shows all most views' do
      it 'should return the most views' do
        expect(logs_view.most_views).to eq(expected_results)
      end
    end
  end

  describe '#unique_views' do
    let(:expected_results) do
      { '/home' => 5, '/index' => 4, '/about' => 1 }
    end
    context 'when shows all unique views' do
      it 'should return the unique views' do
        expect(logs_view.unique_views).to eq(expected_results)
      end
    end
  end
end
