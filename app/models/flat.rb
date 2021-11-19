class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  has_many_attached :photos
  validates :title, :address, :price, :room_type, :persons, :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

  def bookings_dates
    self.bookings.pluck(:start, :end).flat_map { |array| (array.first..array.last).to_a.map(&:to_s) }
  end
end
