require 'active_record'

module Impresser
  module ActiveRecord
    class Base < ::ActiveRecord::Base
      self.abstract_class = true
      self.table_name_prefix = Config[:table_name_prefix]

      def self.set_table_name(tbl_name)
        self.table_name = self.table_name_prefix.concat(tbl_name)
      end

      establish_connection(Config[:connect]) unless Config[:connect].empty?
    end
  end
end
