class Product < ActiveRecord::Base
  has_many :product_details
  has_many :comissions
  has_many :comments
  belongs_to :category
  belongs_to :designer,class_name:"User"
end
