module Impresser
  module ActiveRecord
    class TermRelationship < Base
      self.table_name = with_prefix("term_relationships")
      belongs_to :term_taxonomy
      belongs_to :object, :class_name => "PostBase", :foreign_key => "object_id"
    end
  end
end
