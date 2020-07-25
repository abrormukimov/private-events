class User < ApplicationRecord
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :attended_event
  has_many :events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy

  validates :name, presence: true, length: { minimum: 4 }

  def past_events
    Event.all.where("DATE(date) < DATE(?)", Time.now).order("date DESC")
  end

  def upcoming_events
    Event.all.where("DATE(date) >= DATE(?)", Time.now).order("date ASC")
  end
end
