module Presser
  module ActiveRecord
    class CommentMeta < Base
      set_table_name "commentmeta"
      self.primary_key = "meta_id"

      belongs_to :comment
      validates_presence_of :meta_key
    end
  end
end
