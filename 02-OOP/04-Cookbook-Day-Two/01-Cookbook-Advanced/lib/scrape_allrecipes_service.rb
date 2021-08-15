class ScrapeAllrecipesService
  # RECEBE DE PARAMETRO O INGREDIENTE PEGO NA VIEW
  def initialize(keyword)
    @keyword = keyword
    # INSTACIANDO UMA VIEW PARA PEGAR O INDEX DAS RECEITAS ENTREGUES PELO SCRAPE
    @view = View.new
  end

  def call
    # URL PRINCIPAL - SERA ALTERADO O FINAL COM O INGREDIENTE PEGO NA VIEW(KEYWORD)
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"
    # CARREGANDO O URL COM URI.open E TRANSFORMANDO EM UM OBJETO NOKOGIRI
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')
    # DECLARAO DAS ARRAY PARA PEGAR O NOME DAS RECEITAS E A URL PARA REALIZAR O SCRAP
    names = []
    links = []
    # ITERACAO NOS 5 PRIMEIRO RESULTADOS NA CLASSE .card__recipe
    doc.search('.card__recipe').first(5).each do |card|
      # CONVERTENDO PARA STRING E RETIRANDO OS ESPACOS EXTRAS. SALVANDO O NOME DA RECEITA
      names << card.search('h3.card__title').text.strip
      # PEGANDO O PRIMEIRO ATRIBUTO DE href, EXISTEM DOIS DEVIDO A FOTO QUE TAMBEM POSSUI. SALVANDO O URL DA RRECEITA
      links << card.search('.card__titleLink').first.attribute('href').value
    end
    # PASSANDO A ARRAY COM OS NOMES PARA O METODO DA VIEW IMPRIMIR AS RECEITAS PEGAS NO SCRAP
    @view.display_recipe_names(names)
    # CHAMANDO METODO DA VIEW PARA O USUARIO ESCOLHER QUAL RECEITA SERA SALVA
    index = @view.ask_index
    # SALVANDO O LINK ESCOLHIDO
    url = links[index]
    # CARREGANDO O URL ESCOLHIDO E TRANSFORMANDO EM OBJETO NOKOGIRI
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')
    # SALVANDO O NOME PEGO NA TAG h1
    name = doc.search('h1').text.strip
    # SALVANDO A DESCRICAO PEGO NA CLASSE .recipe-summary
    description = doc.search('.recipe-summary').text.strip
    # SALVANDO O RATING PEGO NA CLASSE .review-star_text. USANDO REGEX PARA PEGAR APENAS O PRIMEIRO
    # ALGORISMO E TRANSFORMANDO EM INTEIRO
    rating = doc.search('.review-star-text').first.text.strip.match(/Rating: (\d)/)[1].to_i
    # PEGO O TERCEIRO RESULTADO DE .recipe-meta-item-body
    prep_time = doc.search('.recipe-meta-item-body')[2].text
    # INSTANCIANDO UMA RECIPE COM AS INFORMACOES COLETADAS DO SCRAP
    Recipe.new(name, description, rating, prep_time)
  end
end
