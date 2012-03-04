module Presser
  module DataMapper
    class Term
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}terms"
    end
  end
end