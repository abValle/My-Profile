require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def add
    # 1. Peguntar o meal
    meals = @meal_repository.all
    MealsView.new.display(meals)
    index = @view.ask_index
    meal = meals[index]
    # 2. Perguntar o customer
    customers = @customer_repository.all
    CustomersView.new.display(customers)
    index = @view.ask_index
    customer = customers[index]

    # 3. Perguntar o rider
    riders = @employee_repository.all_riders
    @view.display_riders(riders)
    index = @view.ask_index
    employee = riders[index]

    # 4. Instanciar uma nova order
    new_order = Order.new(meal: meal, customer: customer, employee: employee)

    # 5. Adicionar no repositorio
    @order_repository.create(new_order)
  end

  def list_undelivered_orders
    # 1. Pegar todas as orders nao entregues
    undelivereds = @order_repository.undelivered_orders
    # 2. Mostrar as orders
    @view.display(undelivereds)
  end

  def list_my_orders(employee)
    # 1. Pegar  as orders do employee
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    # 2. Mostrar as orders
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    # 1. Mostrar todas as orders nao entregues do employee
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(orders)
    # 2. Perguntar o index
    index = @view.ask_index
    order = orders[index]
    # 3. Marcar como entregue
    order.deliver!
    # 4. Salvar no repositorio
    @order_repository.save_csv
  end
end
