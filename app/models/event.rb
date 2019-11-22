class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  validates :venue_id, presence: true
  # validates :name, presence: true
  # attribute :date_and_time, :datetime


  MONTHS = [
    ['January', 31],
    ['February', 29],
    ['March', 31],
    ['April', 30],
    ['May', 31],
    ['June', 30],
    ['July', 31],
    ['August', 31],
    ['September', 30],
    ['October', 31],
    ['November', 30],
    ['December', 31] ]
end
