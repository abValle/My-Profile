class Meal
  attr_accessor :id
  attr_reader :name, :price

    def initialize(attributes = {})
      @name = attributes[:name]
      @price = attributes[:price] || 0
      @id = attributes[:id]
    end
end
