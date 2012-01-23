module Presser
  module ActiveRecord
    class Option < Base
      self.primary_key = "option_id"

      validates_presence_of :option_name
      validates_inclusion_of :autoload, :in => %w(yes no)
    end
  end
end
