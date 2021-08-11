require 'csv'
# Banco de dados
class Cookbook
  # Add
  # Delete
  # Save
  # Load
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @recipes = []
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def all
    @recipes
  end

  def remove_recipe(index_rm)
    @recipes.delete_at(index_rm)
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file) do |row|
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      @recipes << recipe
    end
  end
end
