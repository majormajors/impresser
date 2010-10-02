module Presser
  module DataMapper
    class Option
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}options"
    end
  end
end