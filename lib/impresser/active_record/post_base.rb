module Impresser
  module ActiveRecord
    class PostBase < Base
      self.table_name = with_prefix("posts")
      self.primary_key = "ID"

      attr_protected :post_type

      set_inheritance_column "post_type"
      has_many :comments, :foreign_key => "comment_post_ID"
      has_many :metas, :class_name => "PostMeta", :foreign_key => "post_id" do
        def [](key)
          self.where(:meta_key => key).first.try(:meta_value)
        end
      end
      belongs_to :user, :foreign_key => "post_author"
      has_many :term_relationships, :foreign_key => "object_id"

      validates_presence_of :post_title
  
      def generate_guid
        %()
      end
    
      def self.find_sti_class(type_name)
        if %w(post page attachment).include?(type_name)
          "Impresser::ActiveRecord::#{type_name.classify}".constantize
        else
          Impresser::ActiveRecord::PostBase
        end
      end
    end
  end
end
