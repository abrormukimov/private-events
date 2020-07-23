class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :past, -> { Event.all.where('DATE(date) < DATE(?)', Time.now).order("date DESC") }
  scope :upcoming, -> { Event.all.where('DATE(date) >= DATE(?)', Time.now).order("date DESC") }
end
