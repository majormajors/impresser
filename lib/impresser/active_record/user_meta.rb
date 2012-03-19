require 'impresser/mixin/serialization_helper'

module Impresser
  module ActiveRecord
    class UserMeta < Base
      extend Impresser::SerializationHelper

      php_serializable :meta_value

      self.table_name = with_prefix("usermeta")
      self.primary_key = "umeta_id"

      belongs_to :user
      validates_presence_of :meta_key
    end
  end
end
