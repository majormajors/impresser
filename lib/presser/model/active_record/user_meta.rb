module Presser
  class UserMeta < Base
    set_table_name table_name_prefix + "usermetas"
    set_primary_key "umeta_id"
    belongs_to :user
    validates_presence_of :meta_key
  end
end