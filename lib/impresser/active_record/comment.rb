module Impresser
  module ActiveRecord
    class Comment < Base
      self.table_name = with_prefix("comments")
      self.primary_key = "comment_ID"

      belongs_to :post, :foreign_key => "comment_post_ID"
      has_many :comments, :foreign_key => "comment_parent"
      belongs_to :comment, :foreign_key => "comment_parent"
      belongs_to :user
      has_many :metas, :class_name => "CommentMeta" do
        def [](key)
          self.where(:meta_key => key).first.try(:meta_value)
        end
      end
      validates_presence_of :comment_author, :comment_author_email, :comment_author_IP, :comment_content
    end
  end
end
