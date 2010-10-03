module Presser
  module ActiveRecord
    class Base < ::ActiveRecord::Base
      self.abstract_class = true

      def self.table_name_prefix
        Config[:table_name_prefix]
      end

      establish_connection(Config[:connect]) unless Config[:connect].empty?
    end
  end
end

Presser.load_models_for(:active_record)
Presser.send(:include, Presser::ActiveRecord)