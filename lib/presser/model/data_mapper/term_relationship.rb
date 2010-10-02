module Presser
  module DataMapper
    class TermRelationship
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}term_relationships"
    end
  end
end