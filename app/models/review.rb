class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  validates :content, :rating, presence: true
end
