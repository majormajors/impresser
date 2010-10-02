module Presser
  module DataMapper
    class PostBase
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}posts"
      
      property :id,           Serial, :field => "ID"
      property :post_title,   Text
      property :post_content, Text
      property :post_type,    Discriminator
    end
  end
end