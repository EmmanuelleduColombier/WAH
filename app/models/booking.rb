class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  validates :start, :end, presence: true
end
