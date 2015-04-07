class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comissions
  has_many :comments
  has_many :orders,foreign_key:"customer_id"
  has_many :designed_products,class_name:"Product",foreign_key:"designer_id"
end
