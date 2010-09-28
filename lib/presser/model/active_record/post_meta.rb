module Presser
  class PostMeta < Base
    set_table_name "postmeta"
    set_primary_key "meta_id"
    belongs_to :post
    validates_presence_of :meta_key
  end
end