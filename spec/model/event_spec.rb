require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    User.create(name: 'Abror')
    Event.create(title: 'title', description: 'description', date: Time.now, creator_id: 1)
  end

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

  describe 'past and upcomings events' do
    it 'checks previous events' do
      Event.create(title: 'title2', description: 'description2', date: Time.now - 1.day, creator_id: 1)
      past_event = Event.past.any? { |event| event.date < Time.now }
      expect(past_event).to eq(true)
    end

    it 'checks upcoming events' do
      Event.create(title: 'title3', description: 'description3', date: Time.now + 1.day, creator_id: 1)
      upcoming_event = Event.upcoming.any? { |event| event.date >= Time.now }
      expect(upcoming_event).to eq(true)
    end
  end
end
