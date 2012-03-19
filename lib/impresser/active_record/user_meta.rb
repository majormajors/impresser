module Impresser
  module ActiveRecord
    class UserMeta < Base
      set_table_name "usermetas"
      self.primary_key = "umeta_id"

      belongs_to :user
      validates_presence_of :meta_key
    end
  end
end
