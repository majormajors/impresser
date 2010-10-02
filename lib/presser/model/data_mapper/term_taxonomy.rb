module Presser
  module DataMapper
    class TermTaxonomy
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}term_taxonomy"
    end
  end
end