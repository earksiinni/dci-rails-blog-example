module BlogService
  module Physical
    class BlogController < ApplicationController
      def index
        @posts = BlogService::Contexts::ListingPosts.summarize_recent_published_posts
      end
    end
  end
end