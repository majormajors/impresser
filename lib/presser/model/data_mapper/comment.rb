module Presser
  module DataMapper
    class Comment
      include ::DataMapper::Resource
      storage_names[Config.repository] = "#{Config.table_prefix}comments"
      
      property :id,               Serial, :field => "comment_ID"
      property :comment_content,  Text
      property :comment_date,     Time
      property :comment_date_gmt, Time
    end
  end
end