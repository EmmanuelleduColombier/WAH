class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :first_name, :last_name, :email, :password, :photo, presence: true
  validates :email, uniqueness: true
end
