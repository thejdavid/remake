# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
User.create!(username: Faker::Name.name, email: "jd@jd.com", password: "password",picture:Faker::Avatar.image,artist: true)
10.times {Category.create!(name:Faker::Commerce.department) }

array_of_cat_id = []

all_category = Category.all
all_category.each {|category| array_of_cat_id << category.id }
10.times{User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password",picture:Faker::Avatar.image,artist: true) }
10.times{User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password",picture:Faker::Avatar.image) }

user = User.all

product_pict = ["http://s3.amazonaws.com/nikeinc/assets/1627/13_FINAL_SHOT_1500x1500_1_original.jpg",
"http://eoimages.gsfc.nasa.gov/images/imagerecords/44000/44517/npacificcer_tmo_2009271_lrg.jpg",
"http://www.etcetc.tv/wp-content/uploads/BEN-PEARCE-1500X1500.jpg",
"http://wallpoper.com/images/00/31/22/55/abstract-fire_00312255.jpg",
"http://www.allwallpaper.in/wallpapers/1500x1500/15213/original-content-clouds-scenic-skies-skyscapes-1500x1500-wallpaper.jpg",
"http://nesthq.com/wp-content/uploads/2013/11/1500x1500-72dpi.jpg",
"https://cdn-images.9cloud.us/1000/the_rolling_stones___grrr_1500x1500_2002192713.jpg",
"http://www.herschel.caltech.edu/system/avm_image_sqls/binaries/133/huge/nhsc2013-022a.jpg",
"http://www.kaleidoscopeadventures.com/wp-content/uploads/2014/11/ka-background-1500x1500.jpg",
"http://dinealonerecords.com/wp-content/uploads/2015/03/HEARTLESS_BASTARDS-restless_ones-1500x1500.jpg"]
30.times {Product.create!(name: Faker::Commerce.product_name, category_id: array_of_cat_id.sample, image: product_pict.sample, designer_id:user.sample.id) }

