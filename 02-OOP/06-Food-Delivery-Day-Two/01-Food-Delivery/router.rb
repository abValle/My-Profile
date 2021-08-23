class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @employee = @sessions_controller.sign_in
    loop do
      if @employee.manager?
        print_actions_manager
        action = gets.chomp.to_i
        break if action == 99

        dispatch_manager(action)
      else
        print_actions_rider
        action = gets.chomp.to_i
        break if action == 99

        dispatch_rider(action)
      end
    end
    puts "Goodbye..."
  end

  private

  def print_actions_manager
    puts '-' * 50
    puts ' Managers Options'
    puts '-' * 50
    puts '1. Create a meal'
    puts '2. List all meals'
    puts '-' * 50
    puts '3. Create Customer'
    puts '4. List all customers'
    puts '-' * 50
    puts '5. Add Order'
    puts '6. List undelivered orders'
    puts '-' * 50
    puts '99. Exit'
    puts '-' * 50
  end

  def print_actions_rider
    puts '-' * 50
    puts ' Riders Options'
    puts '-' * 50
    puts '1. Mark order as delivered'
    puts '2. List my undelivered orders'
    puts '99. Exit'
    puts '-' * 50
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    end
  end

  def dispatch_rider(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@employee)
    when 2 then @orders_controller.list_my_orders(@employee)
    end
  end
end
