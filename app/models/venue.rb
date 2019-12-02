class Venue < ApplicationRecord
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events

  STATES = [
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Wisconsin', 'WI']
  ]
end
