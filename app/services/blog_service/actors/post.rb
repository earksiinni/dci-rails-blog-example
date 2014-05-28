module BlogService
  module Actors
    class Post
      attr_reader :title, :subtitle, :body
      
      def initialize(title, subtitle, body, publick)
        @title, @subtitle, @body, @public = title, subtitle, body, publick
      end
      
      def is_public?
        @public
      end
      
      def make_public
        @public = true
      end
    end
  end
end