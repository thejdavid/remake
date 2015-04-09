class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.string :username
      t.string :firstname 
      t.string :lastname 
      t.string :building 
      t.string :adress1 
      t.string :ddress2 
      t.string :city 
      t.string :state 
      t.string :paypal_email 
      t.string :phone 
      t.string :billingadress 
      t.string :billingcity 
      t.string :billingregion 
      t.string :billingpostcode 
      t.string :billingcountry 
      t.string :shippingadress 
      t.string :shippingcity 
      t.string :shippingregion
      t.string :shippingpostcode
      t.string :shippingcountry
      t.string :picture
      t.boolean :artist,default: false
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
