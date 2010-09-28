module Presser
  class Option < Base
    set_primary_key "option_id"
    validates_presence_of :option_name
    validates_inclusion_of :autoload, :in => %w(yes no)
  end
end