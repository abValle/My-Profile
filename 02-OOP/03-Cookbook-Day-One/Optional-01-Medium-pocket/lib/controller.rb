require_relative 'view'
require_relative 'post'

class Controller
  def initialize(repo)
    @repo = repo
    @view = View.new
  end

  def create
    url = @view.ask_for_user_post
    post = Post.new(url)

    @repo.add_post(post)
  end
end
