class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: true
  validates :category, presence: true

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  def avg_rating(product_id)
    avg = 0
    count = 0
    Review.all.each do |item|
      if item.product_id == product_id
        avg += item.rating
        count += 1
      end
    end
    if avg > 0
      avg / count
    else
      nil
    end
  end

end
