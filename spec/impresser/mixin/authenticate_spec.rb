require 'spec_helper'
require 'impresser/mixin/authenticate'

describe Impresser::Authenticate do
  before(:each) do
    hashed_password = '$P$BkgreYPfZOYNFX.V9IdMLcaBampElR1'
    @user = mock('User', :login => 'gooduser', :user_pass => hashed_password)
    @good_password = 'abc123'
    @bad_password = 'abc456'
  end

  before(:all) do
    @klass = Class.new
    @klass.__send__(:include, Impresser::Authenticate)
  end

  context "find_user_for_authentication has not been implemented" do
    describe ".authenticate" do
      it{ lambda{ @klass.authenticate('abc', '123') }.should raise_error(NotImplementedError) }
    end
  end

  context "find_user_for_authentication has been implemented" do
    before(:each) do
      @klass.stub(:find_user_for_authentication) do |login|
        login == 'gooduser' ? @user : nil
      end
    end

    describe ".authenticate" do
      it{ lambda{ @klass.authenticate('abc', '123') }.should_not raise_error(NotImplementedError) }

      it "returns the user object when the username and password are good" do
        @klass.authenticate('gooduser', @good_password).should == @user
      end

      it "returns nil when the username is bad" do
        @klass.authenticate('baduser', @good_password).should be_nil
      end

      it "returns nil when the password is bad but the username is good" do
        @klass.authenticate('gooduser', @bad_password).should be_nil
      end
    end
  end
end
