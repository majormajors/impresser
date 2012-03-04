module Presser
  module ActiveRecord
    class Page < PostBase
      has_many :pages, :foreign_key => "post_parent"
      belongs_to :parent, :foreign_key => "post_parent", :class_name => "Page"
    
      def generate_guid
        site_url = Option.where(:option_name => "siteurl").first
        "#{site_url.option_value}/?page=#{self.id}"
      end
    
      def self.sti_name
        "page"
      end
    end
  end
end