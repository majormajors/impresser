module Presser
  module Authenticate
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
    end

    module ClassMethods
      def find_user_for_authentication(login)
        raise Presser::NotImplemented, "Your User class must implement the find_user_for_authentication method"
      end

      def hasher
        @hasher ||= Phpass.new
      end

      def authenticate(login, password)
        user = find_user_for_authentication(login)
        if user && hasher.check(password, user.hashed_password)
          return user
        else
          return nil
        end
      end
    end

    module InstanceMethods
    end
  end
end
