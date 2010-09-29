module Presser
  class CommentMeta < Base
    set_table_name table_name_prefix + "commentmeta"
    set_primary_key "meta_id"
    belongs_to :comment
    validates_presence_of :meta_key
  end
end