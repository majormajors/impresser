module Presser
  class Base < ::ActiveRecord::Base
    self.abstract_class = true
  end
end

Presser.load_models_for(:active_record)
