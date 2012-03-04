module Presser
  module ActiveRecord
    class PostMeta < Base
      set_table_name "postmeta"
      self.primary_key = "meta_id"

      belongs_to :post, :class_name => "PostBase"
      validates_presence_of :meta_key
    end
  end
end
