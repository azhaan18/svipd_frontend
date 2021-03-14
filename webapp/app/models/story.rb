class Story < ApplicationRecord
  validates :title, presence: true
  validates :merchant, presence: true
  validates :desc, presence: true
  validates :image, presence: true
  validates :product_title, presence: true

end
