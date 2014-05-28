module BlogService
  module Actors
    class Blog
      include Singleton
      
      def add_post(post)
        Physical::Post.create!(
          title: post.title, subtitle: post.subtitle,
          body: post.body, public: post.is_public?
        )
      end
      
      def all_posts
        logicalize_posts Physical::Post.all
      end
      
      def posts_within_range(range)
        logicalize_posts Physical::Post.where(id: range)
      end
      
      private
      
        def logicalize_posts(phys_posts)
          phys_posts.to_a.collect { |phys_post|
            Post.new(
              phys_post.title,
              phys_post.subtitle,
              phys_post.body,
              phys_post.public
            )
          }
        end
    end
  end
end