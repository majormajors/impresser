require 'impresser/mixin/serialization_helper'

module Impresser
  module ActiveRecord
    class Option < Base
      extend Impresser::SerializationHelper

      php_serializable :option_value

      self.table_name = with_prefix("options")
      self.primary_key = "option_id"

      validates_presence_of :option_name
      validates_inclusion_of :autoload, :in => %w(yes no)
    end
  end
end
