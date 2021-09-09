require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionsView.new
    @employee_repository = employee_repository
  end

  def sign_in
    # 1. Perguntar o username
    username = @view.ask_username
    # 2. Perguntar o password
    password = @view.ask_password
    # 3. Pegar um employee pelo username
    employee = @employee_repository.find_by_username(username)
    # 4. Se existir um employee e o password estiver correto
    if employee && employee.password == password
      @view.welcome
      # retornar o employee
      return employee
    else
      # mostrar a mensagem de username/password incorreto
      @view.wrong_credentials
      # Pedir novamente o username/password
      sign_in
    end
  end
end
