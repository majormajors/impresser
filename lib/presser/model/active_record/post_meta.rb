module Presser
  class PostMeta < Base
    set_table_name table_name_prefix + "postmeta"
    set_primary_key "meta_id"
    belongs_to :post, :class_name => "PostBase"
    validates_presence_of :meta_key
  end
end