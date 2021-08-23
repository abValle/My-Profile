require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # 1. Perguntar o nome do meal
    name = @view.ask_name
    # 2. Perguntar o preco do meal
    price = @view.ask_price
    # 3. Instanciar um novo meal
    new_meal = Meal.new(name: name, price: price)
    # 4. Adicionar o novo meal ao repositotorio
    @meal_repository.create(new_meal)
  end

  def list
    # 1. Pegar todos os meals
    meals = @meal_repository.all
    # 2. Exibir os meals
    @view.display(meals)
  end
end
