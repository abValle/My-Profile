class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    # TRANSFORMAR RESULTADO TRAGO EM ARRAY DE HASHS
    DB.results_as_hash = true
    # PESQUISANDO NO BANCO E SALVANDO EM UMA VARIAVEL. UTILIZAR ? PARA EVIDAR SQL INJECTIONS
    # .first PARA PEGAR A HASH(RETIRANDO DA ARRAY)
    first_row = DB.execute("SELECT * FROM posts WHERE id = ?", id).first
    # PASSANDO O RESULTADO CASO EXISTA(IF) PARA O METODO build_record, PARA QUE SEJA INSTANCIADO O OBJETO
    build_record(first_row) if first_row
  end

  def self.all
    # TRANSFORMAR RESULTADO TRAGO EM ARRAY DE HASHS
    DB.results_as_hash = true
    # SELECIONANDO TODOS OS REGISTROS DE posts.
    # PASSANDO TODOS OS REGISTROS PELO map PARA QUE SEJA ALTERADA A HASH E INSTANCIADO OS OBJETOS
    DB.execute("SELECT * FROM posts").map { |row| build_record(row) }
  end

  def self.build_record(row)
    # CRIANDO A HASH PARA QUE SEJA INSTANCIADO O OBJETO
    # ROW E' UMA HASH PROVENIENTE DO SELECT
    attributes = {
      # id: recebe o VALOR de row["id"]
      id: row["id"],
      # url: recebe o VALOR de row["url"]
      url: row["url"],
      # etc
      votes: row["votes"],
      title: row["title"]
    }
    # INSTANCIANDO O OBJETO
    Post.new(attributes)
  end
end
