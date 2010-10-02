module Presser
  module DataMapper
    class PostMeta
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}postmeta"
    end
  end
end