require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {
    described_class.new(name: 'Someone')
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it { should validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    it { expect(subject).to have_many(:events) }

    it { expect(subject).to have_many(:attendances) }

    it { expect(subject).to have_many(:attended_events) }
  end
end
