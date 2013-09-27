require 'spec_helper'
require 'impresser/active_record'

describe Impresser::ActiveRecord::Base do
  before :all do
    Impresser::Config[:table_name_prefix] = 'test_'
    Widget = Class.new(Impresser::ActiveRecord::Base)
  end

  after :all do
    Impresser::Config[:table_name_prefix] = 'wp_'
  end

  describe ".with_prefix" do
    it "concats the table name prefix with the table name" do
      Impresser::ActiveRecord::Base.send(:with_prefix, "abc").should == "test_abc"
    end
  end
end
