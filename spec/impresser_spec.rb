require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Impresser" do
  describe "Impresser::Config" do
    it "has some defaults" do
      Impresser::Config[:table_name_prefix].should == 'wp_'
      Impresser::Config[:connect].should be_a(Hash)
      Impresser::Config[:connect].should be_empty
    end
  end

  describe ".setup" do
    it "should append values to the hash" do
      Impresser.should_receive(:require).once.and_return(true)
      Impresser.should_receive(:load_models_for).and_return(Impresser::MODEL_NAMES)
      Impresser.setup(:active_record, :table_name_prefix => 'test-')
      Impresser::Config[:table_name_prefix].should == 'test-'
    end
  end

  describe ".load_models_for" do
    it "requires the model files for the specified ORM" do
      Impresser.should_receive(:require).exactly(Impresser::MODEL_NAMES.count).times.and_return(true)
      Impresser.load_models_for(:derp)
    end
  end
end
