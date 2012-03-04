module Presser
  module DataMapper
    class UserMeta
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}usermeta"
      
    end
  end
end