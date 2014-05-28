module BlogService
  module Roles
    class Poster < SimpleDelegator
      def publish(post)
        post.make_public
        self.add_post(post)
      end
    end
  end
end