require_relative '../models/meal'

class MealRepository
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    load_csv if File.exist?(@csv_file)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  def find(id)
    # ITERA SOBRE OS OBJETOS DA ARRAY E SELECIONA O OBJETO QUE POSSUE O .ID == ID
    # O METODO SELECT SEMPRE RETORNA UM ARRAY, COM FIRST E' RETIRADO O OBJETO DA ARRAY
    @meals.select { |meal| meal.id == id }.first
  end

  private

  def save_csv
    # 'wb' WRITE BINARY - ARQUIVO DE ESCRITA
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|
      # PASSANDO O HEADER. %i -> ARRAY DE SYMBOL
      file << %i[id name price]
      @meals.each do |meal|
        file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      id = row[:id].to_i
      name = row[:name]
      price = row[:price].to_i
      meal = Meal.new(id: id, name: name, price: price)
      @meals << meal
    end
  end
end
