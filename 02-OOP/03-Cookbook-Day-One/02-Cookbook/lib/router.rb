# ROUTER E RESPONSAVEL POR "RODAR O PROGRAMA"
class Router
  # RECEBE COMO PARAMETRO O CONTROLLER QUE FARA A COMUNICACAO ENTRE AS OUTRAS CLASSES
  # CLASSE DE INTERACAO VIEW, BANCO DE DADOS, MODEL, ETC
  def initialize(controller)
    @controller = controller
    # STATUS INICIAL UTILIZADO NA SAIDA DO LOOPING
    @running = true
  end

  # METODO DE PROCESSAMENTO DO PROGRAMA
  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "
    # LOOPING DE INTERACAO COM O USUARIO @RUNNING = TRUE
    while @running
      # CHAMADO DO METODO UTILIZADO PARA IMPRIMIR AS OPCOES
      display_tasks
      # SALVANDO A OPCAO ESCOLHIDA PELO USUARIO
      action = gets.chomp.to_i
      # LIMPAR A TELA
      print `clear`
      # PASSANDO COMO ARGUMENTO A OPCAO ESCOLHIDA PELO USUARIO PARA O METODO ROUTE_ACTION
      # QUE SERA RESPONSAVEL PELA CHAMADA DOS METODOS DO CONTROLLER
      route_action(action)
    end
  end

  private

  # RESPONSAVEL PELA CHAMADA DOS METODOS DO CONTROLLER ATRAVES DA OPCAO ESCOLHIDA PELO USUARIO
  def route_action(action)
    case action
    # LISTAR RECEITAS
    when 1 then @controller.list
    # CRIAR RECEITA
    when 2 then @controller.create
    # REMOVER RECEITA
    when 3 then @controller.destroy
    # PARAR PROGRAMA
    when 4 then stop
    else
      # OPCAO INVALIDA
      puts "Please press 1, 2, 3 or 4"
    end
  end

  # METODO PARA PARAR O PROGRAMA, RETORNA FALSE EM @RUNNING, SAINDO ASSIM DO LOOPING
  def stop
    @running = false
  end

  # METODO PARA IMPRIMIR AS OPCOES EXISTENTES
  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Create a new recipe"
    puts "3 - Destroy a recipe"
    puts "4 - Stop and exit the program"
  end
end
