require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'view'
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv') # "Criacao do banco de dados" \%%%\como funciona?
cookbook   = Cookbook.new(csv_file) # Cookbook tera os metodos de alteracao do banco de dados,recebe como argumento o BD
controller = Controller.new(cookbook)
router = Router.new(controller)
# Start the app
router.run
