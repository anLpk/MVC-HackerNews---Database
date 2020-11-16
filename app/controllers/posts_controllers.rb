class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    posts = Post.all
    @view.display(posts)
  end

  def create
    title = @view.title
    url = @view.url
    votes = @view.votes
    post = Post.new(title: title, url: url, votes: votes)
    post.create
  end

  def update
    # TODO: implement updating an existing post
    title = @view.title
    url = @view.url
    votes = @view.votes
    # Update the post
    post.title = title
    post.url = url
    post.votes = votes
    # Save the post to the database
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    post.destroy
  end
end
