class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :name, :city

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0
    @rating_count = []
  end

  def self.filter_by_city(restaurants, cit)
    restaurants.keep_if do |rest|
      rest.city == cit
    end
  end

  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @rating_count << new_rate
    @average_rating = @rating_count.sum / @rating_count.count
  end
end

cantina_gigio = Restaurant.new("São Paulo", "Cantina Gigio")
cafe_girondino = Restaurant.new("São Paulo", "Café Girondino")
udon_belvedere = Restaurant.new("BH", "Udon Belvedere")

rest_list = []
rest_list << cantina_gigio
rest_list << cafe_girondino
rest_list << udon_belvedere




Restaurant.filter_by_city(rest_list, "BH")
