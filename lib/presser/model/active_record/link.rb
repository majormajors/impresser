module Presser
  class Link < Base
    set_primary_key "link_id"
    belongs_to :user, :foreign_key => "link_owner"
    validates_presence_of :link_name, :link_url
  end
end