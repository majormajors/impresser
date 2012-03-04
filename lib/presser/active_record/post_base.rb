module Presser
  module ActiveRecord
    class PostBase < Base
      set_table_name "posts"
      self.primary_key = "ID"

      set_inheritance_column "post_type"
      has_many :comments, :foreign_key => "comment_post_ID"
      has_many :post_metas
      belongs_to :user, :foreign_key => "post_author"
      has_many :term_relationships, :foreign_key => "object_id"

      validates_presence_of :post_title
  
      def generate_guid
        %()
      end
    
      def self.find_sti_class(type_name)
        case type_name
        when "post" then Post
        when "page" then Page
        else PostBase
        end
      end
    end
  end
end
