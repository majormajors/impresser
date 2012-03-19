module Impresser
  module ActiveRecord
    class PostMeta < Base
      self.table_name = with_prefix("postmeta")
      self.primary_key = "meta_id"

      belongs_to :post, :class_name => "PostBase"
      validates_presence_of :meta_key
    end
  end
end
