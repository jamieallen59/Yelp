# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating: 1, thoughts: 'bad')
kfc.reviews.create(rating: 3, thoughts: 'ok')
kfc.reviews.create(rating: 5, thoughts: 'great')
kfc.reviews.create(rating: 4, thoughts: 'good')

nandos = Restaurant.create(name: 'Nandos')
nandos.reviews.create(rating: 1, thoughts: 'terrible')
nandos.reviews.create(rating: 4, thoughts: 'not too shabby')
nandos.reviews.create(rating: 5, thoughts: 'the most brilliant place ever')
nandos.reviews.create(rating: 5, thoughts: 'amazing')
