class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
  belongs_to :user
  belongs_to :pool
end
