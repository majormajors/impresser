module Impresser
  module ActiveRecord
    class Attachment < PostBase
      def self.sti_name
       "attachment"
      end
    end
  end
end
