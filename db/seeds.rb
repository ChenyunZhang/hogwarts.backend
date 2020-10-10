# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'
require 'faker'
require 'activerecord-reset-pk-sequence'

Pig.destroy_all
Pig.reset_pk_sequence

def cutePiggies(url)
    html = open(url)
    doc = Nokogiri::HTML(html)
    temp_arr = doc.css("body")
    .css("div.site-width")
    .css("gi-asset.gallery-mosaic-asset")
    .css("img.gallery-asset__thumb")
    .map{ |picture|
        picture.attr("src")
    }
    temp_arr
end

pig1 = cutePiggies("https://www.gettyimages.com/photos/pig?mediatype=photography&phrase=pig&sort=mostpopular")
pig2 = cutePiggies("https://www.gettyimages.com/photos/pig?mediatype=photography&page=2&phrase=pig&sort=mostpopular")

pig = pig1+pig2

random_number = Random.new

i = 0
while i < 120 do
    Pig.create(
        name: Faker::Name.name, #Faker::JapaneseMedia::Naruto.character,
        weight: random_number.rand(1.0..8.0).round(2),
        img_url: pig[i],
        highest_medal_achieved: ["Gold", "Silver", "Bronze", "Wooden"].sample,
        greased: [true,false].sample,
        specialty: Faker::Food.dish
    )
    i+=1
end


# pig3 = cutePiggies("https://www.gettyimages.com/photos/pig?mediatype=photography&page=3&phrase=pig&sort=mostpopular")

