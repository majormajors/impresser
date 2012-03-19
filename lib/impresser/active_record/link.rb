module Impresser
  module ActiveRecord
    class Link < Base
      self.table_name = with_prefix("links")
      self.primary_key = "link_id"

      belongs_to :user, :foreign_key => "link_owner"
      validates_presence_of :link_name, :link_url
    end
  end
end
