module Impresser
  module ActiveRecord
    class Term < Base
      self.table_name = with_prefix("terms")
      self.primary_key = "term_id"

      has_many :term_taxonomies
      validates_presence_of :name
    end
  end
end
