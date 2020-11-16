class PostsView
  def title
    puts "Give me the title"
    print "> "
    gets.chomp
  end

  def url
    puts "Give me the URL"
    print "> "
    gets.chomp
  end

  def votes
    puts "Give me the votes"
    print "> "
    gets.chomp.to_i
  end

  def id
    puts "Give me a number"
    print "> "
    gets.chomp.to_i
  end

  def display(posts)
    posts.each do |post|
      puts "#{post.id} -\nTitle: #{post.title}\nURL: #{post.url}\nVotes: #{post.votes}\n\n"
    end
  end
end
