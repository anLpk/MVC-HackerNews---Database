require_relative '../models/post'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    posts = Post.all
    @view.display(posts)
  end

  def create
    # TODO: implement creating a new post
    title = @view.title
    url = @view.url
    votes = @view.votes
    post = Post.new(title: title, url: url, votes: votes)
    post.create
  end

  def update
    # TODO: implement updating an existing post
  end

  def destroy
    # TODO: implement destroying a post
  end

  def upvote
    # TODO: implement upvoting a post
  end
end
