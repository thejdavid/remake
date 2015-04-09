class MoreTables < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :designer_id
      t.string :name
      t.string :description
      t.string :image
    end

    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :picture
    end

    create_table :comments do |t|
      t.string :title
      t.string :content
      t.integer :product_id
      t.integer :user_id
    end

    create_table :orders do |t|
      t.integer :payment_id
      t.integer :customer_id
      t.integer :ordernumber
      t.date :shippingdate
      t.string :totalweight
      t.date :paymentdate
      t.date :orderdate
    end

    create_table :payments do |t|
      t.string :payment_type
      t.boolean :allowed
    end

    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :price
      t.boolean :fullfilled
      t.string :size
      t.string :frame_color
      t.string :frame_model
      t.string :weight
    end

    create_table :product_details do |t|
      t.string :size
      t.string :frame_color
      t.string :frame_model
      t.integer :product_id
      t.integer :designer_markup
    end

    create_table :comissions do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :markup
    end
  end
end