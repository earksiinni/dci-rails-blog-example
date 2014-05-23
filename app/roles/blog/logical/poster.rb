module Blog
  module Logical
    class Poster < SimpleDelegate
      alias_method :poster, :self
      
      def publish(post)
        post.make_public
        poster.add_post(post)
      end
    end
  end
end