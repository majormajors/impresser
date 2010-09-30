module Presser
  class Base < ::ActiveRecord::Base
    self.abstract_class = true
    def self.table_name_prefix
      Config.table_prefix
    end
  end
end

Presser.load_models_for(:active_record)
Presser.send(:include, Presser::ActiveRecord)