require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    posts = Post.all
    @view.display(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_user_for("title")
    url = @view.ask_user_for("url")
    # Cria e Salva
    post = Post.create(title: title, url: url)
    display_posts
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    display_posts
    id = @view.ask_user_for_id("id").to_i
    title = @view.ask_user_for("title")
    url = @view.ask_user_for("url")
    post = Post.find(id)
    post.update(title: title, url: url)
    display_posts
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    display_posts
    id = @view.ask_user_for_id("id").to_i
    Post.destroy(id)
    display_posts
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    display_posts
    id = @view.ask_user_for_id("id").to_i
    post = Post.find(id)
    post.update(votes: post.votes + 1)
    display_posts
  end

  private

  def display_posts
    posts = Post.all
    @view.display(posts)
  end
end
