class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :past_events, -> { where('DATE(date) < DATE(?)', Time.now) }
  scope :upcoming_events, -> { where('DATE(date) >= DATE()?)', Time.now) }

end
