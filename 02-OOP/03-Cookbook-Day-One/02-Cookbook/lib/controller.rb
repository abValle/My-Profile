# MODERADOR. Nao executa!
require_relative 'recipe'
require_relative 'view'

# RECEBE DE PARAMETRO A INSTANCIA DE COOKBOOK(BD)
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    # INSTANCIAMENTO DO OBJETO VIEW
    @view = View.new
  end

  # ME'TODO PARA CRIAR E SALVAR RECIPES
  def create
    # CHAMADA DO METODO EM VIEW PARA RECEBER O NOME DA RECIPE
    name = @view.ask_user_for_name
    # CHAMADA DO METODO EM VIEW PARA RECEBER A DESCRICAO DA RECIPE
    description = @view.ask_user_for_description
    # INTANCIAMENTO DA RECIPE
    recipe = Recipe.new(name, description)
    # SALVANDO A RECIPE EM COOKBOOK
    @cookbook.add_recipe(recipe)
  end

  # METODO PARA IMPRIMIR AS RECIPES
  def list
    # SALVANDO A ARRAY DE RECIPES RETORNADA PELO MOTO ALL EM COOKBOOK
    recipes = @cookbook.all
    # ENVIANDO A ARRAY PARA O METODO DISPLAY EM VIEW PARA IMPRESSAO
    @view.display(recipes)
  end

  # METODO PARA REMOVES RECIPES
  def destroy
    # SALVANDO O INDEX RECEBIDO DO USUARIO ATRAVES DO METODO EM VIEW
    index = @view.ask_user_for_index
    # ENVIANDO O INDEX PARA COOKBOOK PARA QUE SEJA REMOVIDO COM O METODO REMOVE_RECIPE
    @cookbook.remove_recipe(index)
  end
end
