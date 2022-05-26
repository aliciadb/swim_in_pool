class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  # has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = %w[jacuzzi olympic slides wavepool indoor outdoor natural infinity lap heated salty kids\ friendly]

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
