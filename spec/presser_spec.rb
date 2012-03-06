require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Presser" do
  describe "Presser::Config" do
    it "has some defaults" do
      Presser::Config[:table_name_prefix].should == 'wp_'
      Presser::Config[:connect].should be_a(Hash)
      Presser::Config[:connect].should be_empty
    end
  end

  describe ".setup" do
    it "should append values to the hash" do
      Presser.should_receive(:require).once.and_return(true)
      Presser.should_receive(:load_models_for).and_return(Presser::MODEL_NAMES)
      Presser.setup(:active_record, :table_name_prefix => 'test-')
      Presser::Config[:table_name_prefix].should == 'test-'
    end
  end

  describe ".load_models_for" do
    it "requires the model files for the specified ORM" do
      Presser.should_receive(:require).exactly(Presser::MODEL_NAMES.count).times.and_return(true)
      Presser.load_models_for(:derp)
    end
  end
end
