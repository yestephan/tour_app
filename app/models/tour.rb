class Tour < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :language, presence: true
  validates :price, presence: true
end
