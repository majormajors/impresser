require 'spec_helper'
require 'presser/model/active_record'

describe Presser::ActiveRecord::Base do
  before :all do
    Presser::ActiveRecord::Base.table_name_prefix = 'test_'
    Widget = Class.new(Presser::ActiveRecord::Base)
  end

  describe "#full_table_name_prefix" do
    it "returns, for the parent class, the table_name_prefix we set" do
      Presser::ActiveRecord::Base.table_name_prefix.should == 'test_'
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
