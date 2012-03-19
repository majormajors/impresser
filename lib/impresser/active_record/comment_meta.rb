require 'impresser/mixin/serialization_helper'

module Impresser
  module ActiveRecord
    class CommentMeta < Base
      extend Impresser::SerializationHelper

      php_serializable :meta_value

      self.table_name = with_prefix("commentmeta")
      self.primary_key = "meta_id"

      belongs_to :comment
      validates_presence_of :meta_key
    end
  end
end
