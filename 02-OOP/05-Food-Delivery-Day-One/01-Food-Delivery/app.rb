# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/models/meal'
require 'colored'

meal1 = Meal.new(name: "X-burguer", id: 1, price: 25.5)

p meal1
