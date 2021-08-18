require 'colored'

class MealView
  def ask_for_meals_name
    puts "Which meal do you want to add?"
    print ">"
    gets.chomp
  end

  def ask_for_meals_price
    puts "How much this meal coast?"
    print ">"
    gets.chomp.to_i
  end

  def display_meals(meals)
    meals.each do |meal|
      puts "Name: #{meal.name} -> Price: #{meal.price}"
    end
  end
end
