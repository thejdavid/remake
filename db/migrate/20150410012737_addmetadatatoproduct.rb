class Addmetadatatoproduct < ActiveRecord::Migration
  def change
    add_column :products, :image_meta, :text
    add_column :product_details, :baseprice, :integer
  end
end
