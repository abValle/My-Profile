class View
  def ask_user_for_name
    puts "What's the name of the recipe?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_description
    puts "What's the description?"
    print "> "
    return gets.chomp
  end

  def display(recipes)
    puts "------- Receitas -------\n"
    recipes.each_with_index do |recipe, index|
      puts "|#{index + 1}. Name: #{recipe.name} -> Description: #{recipe.description} "
    end
  end

  def ask_user_for_index
    # TODO, incluir prova de index inexistente
    puts "What's the recipe's number to be removed?"
    print "> "
    return gets.chomp.to_i - 1
  end
end
