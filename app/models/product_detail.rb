class ProductDetail < ActiveRecord::Base
  belongs_to :product
  has_many :orders_details
  before_create  :baseprice_price
  before_update  :retail_price_cal
  def baseprice_price
    self.retail_price = self.baseprice
  end
  def retail_price_cal
    self.retail_price = self.baseprice + self.designer_markup
  end
  def line_item
    "#{self.material} #{self.size} #{self.retail_price}$"
  end
end