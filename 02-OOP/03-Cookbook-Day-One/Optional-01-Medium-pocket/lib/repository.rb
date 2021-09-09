# BD
require 'csv'
require_relative 'post'

class Repository
  def initialize(repo_path)
    @repo = repo_path
    @posts = []
    load_csv
  end

  def add_post(post)
    @posts << post
    save_csv
  end

  def save_csv
    CSV.open(@repo, 'wb') do |csv|
      @posts.each do |post|
        csv << [post.article]
      end
    end
  end

  def load_csv
    CSV.foreach(@repo) do |post|
      article = post
      @posts << Post.new(article)
    end
  end
end
