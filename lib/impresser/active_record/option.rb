module Impresser
  module ActiveRecord
    class Option < Base
      self.table_name = with_prefix("options")
      self.primary_key = "option_id"

      validates_presence_of :option_name
      validates_inclusion_of :autoload, :in => %w(yes no)
    end
  end
end
