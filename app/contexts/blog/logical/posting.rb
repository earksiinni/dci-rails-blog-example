# Primary actor: a user
# Goal: publish a post on the blog
# Supporting actors: none
# Preconditions: the user has been authenticated and authorized

module Blog
  module Logical
    class Posting
  
      # 1. The user submits a Post to the System
      # 2. The System publishes the Post
      #   2a. The System sets the Post's status to public
      
      def intitialize(user, post_text, controller)
        @user = user
        @post = Post.new post_text
        @blog = Poster.new(Blog.instance)
        @controller = controller
      end
      
      def self.submit(user, post_text, controller)
        posting = Posting.new user, post_text, controller
        posting.publish
      end
  
      def publish
        @blog.publish(@post)
      end
    end
  end
end