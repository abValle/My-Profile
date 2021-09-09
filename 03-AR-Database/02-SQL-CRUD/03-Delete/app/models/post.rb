class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = ?", @id)
  end

  def self.find(id)
    DB.results_as_hash = true
    post = DB.execute("SELECT * FROM posts WHERE id = ?", id).first
    build_record(post) if post
  end

  def self.all
    DB.results_as_hash = true
    DB.execute("SELECT * FROM posts").map do |post|
      build_record(post)
    end
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
end
