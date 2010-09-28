module Presser
  class TermTaxonomy < Base
    set_table_name "term_taxonomy"
    set_primary_key "term_taxonomy_id"
    belongs_to :term
  end
end