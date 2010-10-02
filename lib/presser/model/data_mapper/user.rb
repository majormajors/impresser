module Presser
  module DataMapper
    class User
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}users"
    end
  end
end