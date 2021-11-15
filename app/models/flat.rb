class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :address, :price, :room_type, :persons, :description, presence: true
end
