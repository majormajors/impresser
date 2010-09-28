module Presser
  class Term < Base
    set_primary_key "term_id"
    has_many :term_taxonomies
    validates_presence_of :name
  end
end