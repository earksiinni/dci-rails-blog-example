module BlogService
  module Physical
    class PostsController < ApplicationController
      def new
        @post = Post.new
      end
      
      def create
        Contexts::Posting.submit(*post_params.values)
        redirect_to root_path
      end
      
      private
      
        def post_params
          params.require(:post).permit(:title, :subtitle, :body)
        end
    end
  end
end