class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :picture, :styles => {:thumb => "100x100>" },
  :storage => :s3,
 :bucket => 'artnshop',
 :s3_credentials => "#{Rails.root}/config/aws.yml",
 :path => "resources/:id/:style/:basename.:extension"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  has_many :comissions
  has_many :comments
  has_many :orders,foreign_key:"customer_id"
  has_many :designed_products,class_name:"Product",foreign_key:"designer_id"
end
