module Presser
  module DataMapper
    class CommentMeta
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}commentmeta"
    end
  end
end