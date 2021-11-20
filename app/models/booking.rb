class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :start, :end, presence: true
  validates :start, date: { before: :end, message: 'End date must be after start date' }

end
