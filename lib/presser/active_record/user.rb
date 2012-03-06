require "presser/mixin/authenticate"

module Presser
  module ActiveRecord
    class User < Base
      include Presser::Authenticate

      self.primary_key = "ID"

      has_many :comments
      has_many :posts, :foreign_key => "post_author"
      has_many :user_metas
      has_many :links, :foreign_key => "link_owner"

      def self.find_user_for_authentication(login)
        self.where(:login => login).first
      end
    end
  end
end
