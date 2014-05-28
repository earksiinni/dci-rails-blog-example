module BlogService
  module Presenters
    class PostSummary
      extend Forwardable
      include ActionView::Helpers::TextHelper
      
      def_delegators :@post, :title, :subtitle
      
      def initialize(post)
        @post = post
      end
      
      def body
        truncate(@post.body, separator: ' ')
      end
    end
  end
end