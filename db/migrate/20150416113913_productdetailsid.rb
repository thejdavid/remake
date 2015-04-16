class Productdetailsid < ActiveRecord::Migration
  def change
    rename_column :order_details, :product_details_id, :product_detail_id
  end
end
