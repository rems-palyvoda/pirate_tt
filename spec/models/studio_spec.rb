require 'rails_helper'

RSpec.describe Studio do
  let(:studio) { described_class.new(1, DateTime.now, DateTime.now + 1.hour) }

  describe '.booked_hours' do
    subject { studio.booked_hours }

    it { is_expected.to eq 1 }
  end

  describe '#where' do
    subject { described_class.where(id: 1) }

    it 'return an array of filtered objects' do
      find_by_id = proc { |rec| rec[:studioId] }
      expect(subject.map(&find_by_id).uniq).to eq [1]
    end
  end
end
