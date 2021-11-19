class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :start, :end, presence: true
end
