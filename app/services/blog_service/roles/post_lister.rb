module BlogService
  module Roles
    class PostLister < SimpleDelegator
      alias_method :lister, :__getobj__
    
      def published_posts
        lister.all_posts.select { |post| post.is_public? }
      end
    
      def published_posts_within_range(range)
        lister.posts_within_range(range).select { |post| post.is_public? }
      end
    end
  end
end