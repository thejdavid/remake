class Order < ActiveRecord::Base
  has_many :order_details
  belongs_to :payment
  belongs_to :customer,class_name:"User"
end