RSpec.describe StudioBookingTime do
  let(:expected_result) do
      { 1 => 20.0, 2 => 80.0 }
  end
  
  before do
    DataLoader.set_custom_data(array_of_attributes: [
      { studioId: 1, startsAt: DateTime.now, endsAt: DateTime.now + 2.hours },
      { studioId: 2, startsAt: DateTime.now, endsAt: DateTime.now + 8.hours }
    ])
  end

  describe ".call" do
    subject { described_class.call }

    it { is_expected.to eq expected_result }
  end
end
