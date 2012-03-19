require 'php_serialize'

module Impresser
  module SerializationHelper
    def php_serializable(*column_names)
      column_names.each do |column_name|
        define_method(column_name) do
          value = read_attribute(column_name)
          if value.to_s.match(/^[abdiorsCONRU]:\d+:/)
            PHP.unserialize(value.to_s)
          else
            value
          end
        end
      end
    end
  end
end
