class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :venue_id, presence: true
  # validates :name, presence: true
  # attribute :date_and_time, :datetime
end
