class OrderDetail < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :product_detail
end
# Order.all.select{|x| x.payment.allowed == true}.each{|order| p order.order_details.select{|order|  order.product.designer_id == 1 }}
