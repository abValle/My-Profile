# MODEL
class Post
  attr_reader :article

  def initialize(post_path)
    @article = post_path
  end
end
