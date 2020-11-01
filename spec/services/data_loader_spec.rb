require 'rails_helper'

RSpec.describe DataLoader do
  subject { DataLoader.data }

  describe '#data' do
    it 'returns array of objects' do
      is_expected.to be_an Array
    end
  end
end

