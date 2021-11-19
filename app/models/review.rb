class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  # belongs_to :flat, through: :bookings
  validates :content, :rating, presence: true
end
