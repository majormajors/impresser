require 'active_record'

module Impresser
  module ActiveRecord
    class Base < ::ActiveRecord::Base
      self.abstract_class = true
      establish_connection(Config[:connect]) unless Config[:connect].empty?

      private

      def self.with_prefix(table_name)
        Config[:table_name_prefix].to_s + table_name.to_s
      end
    end
  end
end

Impresser.send(:include, Impresser::ActiveRecord)
