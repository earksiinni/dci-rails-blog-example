module Blog
  module Logical
    class Blog
      include Singleton
      
      def add_post(post)
        Physical::Post.create! post.title, post.subtitle, post.body
      end
      
      def posts
        posts = Physical::Post.all.collect { |phys_post|
          Post.new(phys_post.title, phys_post.subtitle, phys_post.body)
        }
        return posts
      end
    end
  end
end