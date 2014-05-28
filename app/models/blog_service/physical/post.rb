module BlogService
  module Physical
    class Post < ActiveRecord::Base
      validates :title, presence: true
      validates :subtitle, presence: true
      validates :body, presence: true
      validates :public, presence: true
    end
  end
end