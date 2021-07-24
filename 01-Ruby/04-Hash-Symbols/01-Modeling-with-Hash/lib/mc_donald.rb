def poor_calories_counter(burger, side, beverage)
  # TODO: return number of calories for this mcDonald order
  return BURGER[burger] + SIDE[side] + BEVERAGE[beverage]
end

BURGER = {
  "Hamburger"	=> 250,
  "Cheese Burger"	=> 300,
  "Big Mac"	=> 540,
  "McChicken"	=> 350
}
SIDE = {
  "Salad" =>	15,
  "French Fries"	=> 230
}
BEVERAGE = {
  "Coca Cola"	=> 150,
  "Sprite" =>	150
}

puts poor_calories_counter("McChicken", "French Fries", "Sprite")
