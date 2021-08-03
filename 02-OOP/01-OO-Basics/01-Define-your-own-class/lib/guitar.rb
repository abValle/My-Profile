class Guitar
  attr_reader :brand, :model
  attr_accessor :price

  def initialize(brand, model, price = nil)
    @brand = brand
    @model = model
    @price = price
  end
end
