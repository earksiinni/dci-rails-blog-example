module Blog
  module Logical
    class Post
      def initialize(title, subtitle, body)
        @title, @subtitle, @body = title, subtitle, body
        @public = false
      end
      
      def make_public
        @public = true
      end
    end
  end
end