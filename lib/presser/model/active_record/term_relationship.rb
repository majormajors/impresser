module Presser
  class TermRelationship < Base
    belongs_to :term_taxonomy
    belongs_to :object, :class_name => "PostBase", :foreign_key => "object_id"
  end
end