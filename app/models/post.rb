class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  # - initialize
  # - self.find
  # - self.all
  # - save
  # - destroy
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
  end

  def self.find(id)
    DB.results_as_hash = true
    post = DB.execute("SELECT * FROM posts WHERE id = ?", id)
    if post.empty?
      nil
    else
      result = post[0]
      post = Post.new(id: result["id"], title: result["title"], url: result["url"], votes: result["votes"])
    end
  end

  def self.all
    DB.results_as_hash = true
    posts = DB.execute("SELECT * FROM posts")
    posts.map do |post|
      Post.new(id: post["id"], title: post["title"], url: post["url"], votes: post["votes"])
    end
  end

  def save
    if @id.nil?
      create
    else
      update
    end
  end

  def create
    # INSERT INTO doctors (name, age, specialty)
    # VALUES ('Dr. Dolladille', 45, 'Dentist')
    DB.execute("INSERT INTO
    posts (title, url, votes)
    VALUES ('#{@title}', '#{@url}', #{@votes})")
    @id = DB.last_insert_row_id
  end

  def update
    DB.execute("UPDATE posts
    SET title = '#{@title}', url = '#{@url}', votes = #{@votes}
    WHERE id = #{@id}")
  end

  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = #{id}")
  end
end
