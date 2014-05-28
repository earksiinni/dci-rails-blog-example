# Primary actor: a visitor
# Goal: listing all the blog plosts or recent ones
# Supporting actors: none
# Preconditions: none

module BlogService
  module Contexts
    class ListingPosts
      
      # 1. Get a collection of the blog posts
      #   1a. If recent posts, get last 20
      #   1b. Else, get posts according to provided range
      
      ### ENTRY POINTS ###
      
      def self.summarize_recent_published_posts
        ctx = ListingPosts.new(Actors::Blog.instance)
        ctx.paginate_post_summaries(1)
      end
      
      ### INITIALIZER ###
      
      def initialize(blog)
        @blog = Roles::PostLister.new(blog)
      end
      
      ### ACTIONS ###
      
      def paginate_post_summaries(page_num)
        range = convert_page_to_range(page_num)
        posts = @blog.published_posts_within_range range
        summarize_posts posts
      end
      
      private
      
        def convert_page_to_range(page_number)
          posts_per_page = 20
          range_start = posts_per_page * (page_number - 1) + 1
          range_end = posts_per_page * page_number
          Range.new(range_start, range_end)
        end
        
        def summarize_posts(posts)
          posts.collect { |post| Presenters::PostSummary.new(post) }
        end
    end
  end
end