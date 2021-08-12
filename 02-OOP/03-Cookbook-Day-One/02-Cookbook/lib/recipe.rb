# MODEL, OBJETO SENDO TRABALHADO
class Recipe
  attr_reader :name, :description # DECLARACAOO DOS METODOS DE LEITURA :NAME  E :DESCRIPTION

  # METODO DE INICIALIZACAO DA CLASSE, RECEBE NOME E DESCRICAO
  def initialize(name, description)
    @name = name
    @description = description
  end
end
