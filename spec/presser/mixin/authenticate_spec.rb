require 'spec_helper'
require 'presser/mixin/authenticate'

describe Presser::Authenticate do
  before(:all) do
    @klass = Class.new
    @klass.__send__(:include, Presser::Authenticate)
  end

  context "find_user_for_authentication has not been implemented" do
    describe ".authenticate" do
      it{ lambda{ @klass.authenticate('abc', '123') }.should raise_error(NotImplementedError) }
    end
  end

  context "find_user_for_authentication has not been implemented" do
    before(:all) do
      _self = self
      class << @klass
        def find_user_for_authentication(login)
          _self.mock("User")
        end
      end
    end

    describe ".authenticate" do
      it{ lambda{ @klass.authenticate('abc', '123') }.should_not raise_error(NotImplementedError) }
    end
  end
end
