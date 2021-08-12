class View
  # METODO PARA RECEBER O NOME DA RECIPE
  def ask_user_for_name
    puts "What's the name of the recipe?"
    print "> "
    return gets.chomp
  end

  # METODO PARA RECEBER A DESCRICAO DA RECIPE
  def ask_user_for_description
    puts "What's the description?"
    print "> "
    return gets.chomp
  end

  # METODO PARA IMPRIMIR AS RECIPE. RECEBE DE PARAMETRO A ARRAY COLETADA PELO CONTROLLER EM COOKBOOK
  def display(recipes)
    puts "------- Receitas -------\n"
    # ITERACAO PARA IMPRESSAO
    recipes.each_with_index do |recipe, index|
      # INDEX + 1, PARA MELHOR IMPRESSAO DA LISTA, CONVERTENDO INDEX 0S
      puts "|#{index + 1}. Name: #{recipe.name} -> Description: #{recipe.description} "
    end
  end

  # METODO PARA EXCLUSAO DE RECIPE
  def ask_user_for_index
    # TODO, incluir prova de index inexistente
    puts "What's the recipe's number to be removed?"
    print "> "
    # INDEX - 1, CONVERTENDO INDEX 0
    return gets.chomp.to_i - 1
  end
end
