module Presser
  module ActiveRecord
    class User < Base
      set_primary_key "ID"
      has_many :comments
      has_many :posts, :foreign_key => "post_author"
      has_many :user_metas
      has_many :links, :foreign_key => "link_owner"
    
      def readonly?
        true
      end
    end
  end
end