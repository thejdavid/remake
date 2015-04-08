# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
User.create!(username: Faker::Name.name, email: "jd@jd.com", password: "password",picture:Faker::Avatar.image)
10.times {Category.create!(name:Faker::Commerce.department) }

array_of_cat_id = []

all_category = Category.all
all_category.each {|category| array_of_cat_id << category.id }
10.times{User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password") }
user = User.all

30.times {Product.create!(name: Faker::Commerce.product_name, category_id: array_of_cat_id.sample, image: Faker::Avatar.image, designer_id:user.sample.id) }
