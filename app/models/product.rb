class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: true
  validates :category, presence: true

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

end
