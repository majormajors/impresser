module Presser
  module DataMapper
    class Link
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}links"
    end
  end
end