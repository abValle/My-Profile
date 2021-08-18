# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require 'colored'
require 'csv'

meal_repository = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repository)

meals_controller.add
meals_controller.add

meals_controller.list
