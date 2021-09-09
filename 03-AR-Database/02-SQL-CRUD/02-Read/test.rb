require_relative "app/models/post"
require "sqlite3"

# CRIANDO O BANCO
db_file_path = File.join(File.dirname(__FILE__), "spec/support/posts_spec.db")
DB = SQLite3::Database.new(db_file_path)

# DELETANDO O BANCO PARA SOBRESCREVER AO EXECUTAR O PROGRAMA
DB.execute('DROP TABLE IF EXISTS `posts`;')
# DEFININDO O SQL
create_statement = "
    CREATE TABLE `posts` (
      `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
      `title` TEXT,
      `url` TEXT,
      `votes`  INTEGER
    );"
# CRIANDO O BANDO
DB.execute(create_statement)
# ADICIONANDO NOVOS SITES
DB.execute("INSERT INTO `posts` (title, url, votes) VALUES ('Le Wagon', 'www.lewagon.com', '9000')")
DB.execute("INSERT INTO `posts` (title, url, votes) VALUES ('Github', 'www.github.com', '1600')")
DB.execute("INSERT INTO `posts` (title, url, votes) VALUES ('Slack', 'www.slack.com', '4000')")
DB.execute("INSERT INTO `posts` (title, url, votes) VALUES ('Mozilla', 'www.mozilla.org', '3000')")
DB.execute("INSERT INTO `posts` (title, url, votes) VALUES ('Stackoverflow', 'www.stackoverflow.com', '4300')")

# Write your test code here (and run `ruby test.rb` in your terminal to run it):

sites = Post.all
sites.each do |site|
  puts "#{site.id}. #{site.title} -> VOTE[#{site.votes}] SITE: #{site.url}"
end
