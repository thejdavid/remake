class Product < ActiveRecord::Base
  has_many :product_details
  has_many :comissions
  has_many :comments
  has_many :order_details
  belongs_to :category
  belongs_to :designer,class_name:"User"
  has_attached_file :image,
                    :styles => { :medium => "460x>", :thumb => "100x100>",:vnice=> "400x" },
                    :storage => :s3,
                    :bucket => 'artnshop',
                    :s3_credentials => "#{Rails.root}/config/aws.yml",
                    :path => "resources/:id/:style/:basename.:extension"
  validates_attachment :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  crop_attached_file :image
  after_create  :attributs_creator

  def attributs_creator
    toinch = Imagetoinch.new(self)
    toinch.run
    if toinch.run == false  #file size not printable
      raise "Image to small to be printed"
     else
      pricing_object = Pricing.new(toinch)
      pricing_object.attributs_creation
    end
  end
end