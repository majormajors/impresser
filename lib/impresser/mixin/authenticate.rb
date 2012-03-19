require 'phpass'

module Impresser
  module Authenticate
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
    end

    module ClassMethods
      def find_user_for_authentication(login)
        raise NotImplementedError, "Your User class must implement the find_user_for_authentication method"
      end

      def hasher
        @hasher ||= Phpass.new
      end

      def authenticate(login, password)
        user = find_user_for_authentication(login)
        if user && hasher.check(password, user.user_pass)
          return user
        else
          return nil
        end
      end
    end

    module InstanceMethods
      def hasher
        self.class.hasher
      end

      def hash_password(plain_password)
        hasher.hash(plain_password)
      end
    end
  end
end
