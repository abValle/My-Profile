# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require 'colored'
require 'csv'

meal_repository = MealRepository.new('data/meals.csv')
customer_repository = CustomerRepository.new('data/customers.csv')
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
customers_controller.add
customers_controller.add
customers_controller.list
meals_controller.add
meals_controller.add
meals_controller.list
