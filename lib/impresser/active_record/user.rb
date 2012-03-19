require "impresser/mixin/authenticate"

module Impresser
  module ActiveRecord
    class User < Base
      include Impresser::Authenticate

      self.table_name = with_prefix("users") 
      self.primary_key = "ID"

      validates_confirmation_of :user_pass, :if => lambda{ |u| u.user_pass_changed? }
      validates_presence_of :user_pass_confirmation, :if => lambda{ |u| u.user_pass_changed? }

      has_many :comments
      has_many :posts, :foreign_key => "post_author"
      has_many :user_metas
      has_many :links, :foreign_key => "link_owner"

      def user_pass=(plain_password)
        unless plain_password.empty?
          write_attribute(:user_pass, hash_password(plain_password.to_s))
        end
      end

      def user_pass_confirmation=(plain_password)
        unless plain_password.empty?
          write_attribute(:user_pass_confirmation, hash_password(plain_password.to_s))
        end
      end

      private

      def self.find_user_for_authentication(login)
        self.where(:user_login => login).first
      end
    end
  end
end
