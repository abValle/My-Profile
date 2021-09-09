require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'view'
require_relative 'router'

# "Criacao do banco de dados" \%%%\como funciona?
csv_file   = File.join(__dir__, 'recipes.csv')
# Cookbook tera os metodos de alteracao do banco de dados,recebe como argumento o BD
cookbook   = Cookbook.new(csv_file)
# METODO CONTROLLER RECEBE O BD PARA CHAMAR OS PROPRIOS METODOS DE BD PARA ALTERACAO. A VIEW ESTA SENDO DECLARADA DENTRO
# DE CONTROLLER
controller = Controller.new(cookbook)

# CHAMADA DE ROUTER E ENVIO DE CONTROLLER COMO PARAMETRO
router = Router.new(controller)
# INICIANDO APLICACAO
router.run
