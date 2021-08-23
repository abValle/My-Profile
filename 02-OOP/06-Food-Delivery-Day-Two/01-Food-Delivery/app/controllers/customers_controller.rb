require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # 1. Perguntar o nome do customer
    name = @view.ask_name
    # 2. Perguntar o endereco
    address = @view.ask_address
    # 3. Instanciar um novo customer
    new_customer = Customer.new(name: name, address: address)
    # 4. Adicionar o novo customer ao repositotorio
    @customer_repository.create(new_customer)
  end

  def list
    # 1. Pegar todos os customer
    customer = @customer_repository.all
    # 2. Exibir os customer
    @view.display(customer)
  end
end
