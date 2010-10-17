module Presser
  module ActiveRecord
    class Base < ::ActiveRecord::Base
      self.abstract_class = true

      class << self
        def table_name_prefix
          Config[:table_name_prefix]
        end
        
        alias :orig_set_table_name :set_table_name
        
        def set_table_name(tbl_name)
          orig_set_table_name(table_name_prefix + tbl_name)
        end
      end

      establish_connection(Config[:connect]) unless Config[:connect].empty?
    end
  end
end

Presser.load_models_for(:active_record)
Presser.send(:include, Presser::ActiveRecord)