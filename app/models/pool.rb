class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  # has_many_attached :photos

  CATEGORIES = %w[jacuzzi olympic slides wavepool indoor outdoor natural infinity lap heated salty kids\ friendly]

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :image, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
