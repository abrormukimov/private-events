require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    User.create(name: 'Abror')
    Event.new(title: 'title',
              description: 'description',
              date: DateTime.now,
              created_at: Time.now,
              updated_at: Time.now + 1.day,
              creator_id: 1)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).not_to be_valid
    end
    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a start_date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a creator' do
      subject.creator_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:creator) }

    it { expect(subject).to have_many(:attendees) }

    it { expect(subject).to have_many(:attendances) }
  end
end
