require 'composite_primary_keys'

module Impresser
  module ActiveRecord
    class TermRelationship < Base
      self.table_name = with_prefix("term_relationships")
      self.primary_keys = :object_id, :term_taxonomy_id
      belongs_to :term_taxonomy
      belongs_to :object, :class_name => "PostBase", :foreign_key => "object_id"
    end
  end
end
