class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :address, :price, :room_type, :persons, :description, presence: true

  def bookings_dates
    self.bookings.pluck(:start, :end).flat_map { |array| (array.first..array.last).to_a.map(&:to_s) }
  end
end
