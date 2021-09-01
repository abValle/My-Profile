class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def save
    @id ? update : insert
  end

  def self.all
    DB.results_as_hash = true
    DB.execute("SELECT * FROM posts").map { |post| build_record(post) }
  end

  def self.build_record(post)
    attributes = {
      id: post["id"],
      url: post["url"],
      votes: post["votes"],
      title: post["title"]
    }
    Post.new(attributes)
  end

  private

  def update
    DB.execute('UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?', @title, @url, @votes, @id)
  end

  def insert
    DB.execute('INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)', @title, @url, @votes)
    # RETORNAR ULTIMO ID CRIADO NO BANCO PARA O OBJETO EM RUBY
    @id = DB.last_insert_row_id
  end
end
