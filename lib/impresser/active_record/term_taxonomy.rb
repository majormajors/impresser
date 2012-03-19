module Impresser
  module ActiveRecord
    class TermTaxonomy < Base
      self.table_name = with_prefix("term_taxonomy")
      self.primary_key = "term_taxonomy_id"

      belongs_to :term
      has_many :term_relationships
    end
  end
end
