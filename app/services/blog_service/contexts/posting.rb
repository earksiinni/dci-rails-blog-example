# Primary actor: a user
# Goal: publish a post on the blog
# Supporting actors: none
# Preconditions: the user has been authenticated and authorized

module BlogService
  module Contexts
    class Posting
    
      # 1. The user submits a Post to the System
      # 2. The System publishes the Post
      #   2a. The System sets the Post's status to public
      
      ### ENTRY POINTS ###
      
      def self.submit(title, subtitle, body)
        posting = Posting.new(title, subtitle, body)
        posting.publish
      end
      
      ### INITIALIZER ###
      
      def initialize(title, subtitle, body)
        @post = Actors::Post.new title, subtitle, body, nil
        @blog = Roles::Poster.new(Actors::Blog.instance)
      end
      
      ### ACTIONS ###
    
      def publish
        @blog.publish(@post)
      end
    end
  end
end