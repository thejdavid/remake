class Imagetoinch
  attr_reader :onefiffty_dpi, :threehundred_dpi, :id
  def initialize(product)
    #paperclip meta image_size method
    @id = product.id
    @image_size = product.image.image_size
    @onefiffty_dpi = []
    @threehundred_dpi = []
    @array_of_printable_size =[]
  end

  def run
    to_inch
    max_printable_size
    # If statement as Size validator for the picture
    if max_printable_size == nil
      false
    else
      all_size
    end
  end

  def to_inch
    @image_size.split("x").each do |side|
      @onefiffty_dpi << side.to_i / 150
      @threehundred_dpi << side.to_i / 300
    end
  end
#maximum error ratio for both sides ex: an image of 41x41 inch would print at same price but wouldn't if it was 41x42 or 38x41 etc.

  def max_printable_size
    hash_of_size = {
      39..41 => "40x40",
      29..31 => "30x30",
      19..21 => "20x20",
      8..11 => "10x10"
    }
    if hash_of_size.select {|range_side| range_side === onefiffty_dpi[0]}.values.first == hash_of_size.select {|range_side| range_side === onefiffty_dpi[1] }.values.first
      hash_of_size.select {|range_side| range_side === onefiffty_dpi[0]}.values.first
    end
  end

  def all_size
    allprintablesize = ["40x40","30x30","20x20","10x10"]
    allprintablesize.reject {|item| allprintablesize.rindex(item) < allprintablesize.rindex(max_printable_size) }
  end
end


# class Imagetoprint
#   def initialize(imageToInchObject)
#     @image_ti_object = imageToInchObject
#     @array_of_printable_size =[]
#   end
# #maximum error ratio for both sides ex: an image of 41x41 inch would print at same price but wouldn't if it was 41x42 or 38x41 etc.
#   def max_printable_size
#     hash_of_size = {
#       39..41 => "40x40",
#       29..31 => "30x30",
#       19..21 => "20x20",
#       8..11 => "10x10"
#     }
#     if hash_of_size.select {|range_side| range_side === @image_ti_object.onefiffty_dpi[0]}.values.first == hash_of_size.select {|range_side| range_side === @image_ti_object.onefiffty_dpi[1] }.values.first
#       hash_of_size.select {|range_side| range_side === @image_ti_object.onefiffty_dpi[0]}.values.first
#     else
# # False veut dire quil ny a pas de printable size.
#       false
#     end
#   end

#   def all_size
#     allprintablesize = ["40x40","30x30","20x20","10x10"]
#     allprintablesize.reject {|item| allprintablesize.rindex(item) < allprintablesize.rindex(max_printable_size) }
#   end
# end

class Pricing
  def initialize(to_print_object)
    @to_print_object = to_print_object
  end
  def attributs_creation
  material_price_by_size = {
    "material1" => {
    "40x40" => 60,
    "30x30" => 40,
    "20x20" => 20,
    "10x10" => 15
    },
    "material2" => {
    "40x40" => 30,
    "30x30" => 25,
    "20x20" => 15,
    "10x10" => 5
    },
    "material3" => {
    "40x40" => 160,
    "30x30" => 140,
    "20x20" => 120,
    "10x10" => 115
    }
  }
  @to_print_object.all_size.each do |size|
    material1_price = material_price_by_size["material1"][size]
    ProductDetail.create!(product_id:@to_print_object.id, material:"material1", baseprice:material1_price,size:size)
    material2_price = material_price_by_size["material2"][size]
    ProductDetail.create!(product_id:@to_print_object.id, material:"material2", baseprice:material2_price,size:size)
    material3_price = material_price_by_size["material3"][size]
    ProductDetail.create!(product_id:@to_print_object.id, material:"material3", baseprice:material3_price,size:size)
   end
  end
  # method de ratio pour le preview select js a lupload
  # def aspect_ratio
  #   original_ratio = original_width / original_height
  #   designer_ratio = designer_width / designer_height   ## taille de l'image de preview
  #   if original_ratio > designer_ratio
  #     designer_height = designer_width / original_ratio
  #   else
  #     designer_width = designer_height * original_ratio
  #   end
  # end
end
# p = Product.last
# t = Imagetoinch.new(p)
# t.to_inch
# c = Imagetoprint.new(t)
# c.max_printable_size
# c.all_size
# l = Pricing.new(c)
# l.attributs_creation
# UTILISE LE AFTER_SAVE CALLBACK POUR INSTANTIACTION CA EVITE DE CREE DES PRODUCTS_DETAILS QUAND LE PRODUCT EST PAS SAUVER.