module Presser
  module ActiveRecord
    class TermTaxonomy < Base
      set_table_name table_name_prefix + "term_taxonomy"
      set_primary_key "term_taxonomy_id"
      belongs_to :term
      has_many :term_relationships
    end
  end
end