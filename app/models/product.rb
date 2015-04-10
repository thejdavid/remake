class Product < ActiveRecord::Base
  has_many :product_details
  has_many :comissions
  has_many :comments
  belongs_to :category
  belongs_to :designer,class_name:"User"
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>",:vsmall => "50x50>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
