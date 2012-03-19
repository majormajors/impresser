require 'spec_helper'
require 'impresser/active_record'

describe Impresser::ActiveRecord::Base do
  before :all do
    Impresser::ActiveRecord::Base.table_name_prefix = 'test_'
    Widget = Class.new(Impresser::ActiveRecord::Base)
  end

  describe "#full_table_name_prefix" do
    it "returns, for the parent class, the table_name_prefix we set" do
      Impresser::ActiveRecord::Base.table_name_prefix.should == 'test_'
    end

    it "returns, for the child class, the table_name_prefix we set" do
      Widget.table_name_prefix.should == 'test_'
    end
  end

  describe "#set_table_name" do
    it "auto-interpolates the table_name_prefix" do
       Widget.table_name.should == "test_widgets"
       Widget.set_table_name("widget_tbl")
       Widget.table_name.should == "test_widget_tbl"
    end
  end
end
