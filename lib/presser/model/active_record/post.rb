module Presser
  module ActiveRecord
    class Post < PostBase
      def generate_guid
        site_url = Option.where(:option_name => "siteurl").first
        "#{site_url.option_value}/?p=#{self.id}"
      end
    
      def self.sti_name
        "post"
      end
    end
  end
end