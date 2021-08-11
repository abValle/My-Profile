# MODERADOR. Nao executa!
require_relative 'recipe'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    # Pedindo o nome
    name = @view.ask_user_for_name
    description = @view.ask_user_for_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def destroy
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end
end
