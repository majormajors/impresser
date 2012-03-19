require 'spec_helper'
require 'impresser/mixin/serialization_helper'

describe Impresser::SerializationHelper do
  describe "#php_serializable" do
    before(:each) do
      @klass = Class.new
      @klass.extend(Impresser::SerializationHelper)
      @klass.php_serializable(:test_abc)
    end

    subject { @klass.new }

    it { subject.should respond_to(:test_abc) }

    it "returns nil when the column's value is nil" do
      subject.should_receive(:read_attribute).with(:test_abc).and_return(nil)
      subject.test_abc.should be_nil
    end

    it "returns the de-serialized value when it detects a serialized php object" do
      subject.should_receive(:read_attribute).with(:test_abc).and_return('a:1:{i:0;s:3:"abc";}')
      subject.test_abc.should == ['abc']
    end

    it "returns the plain value when it isn't a serialized object" do
      subject.should_receive(:read_attribute).with(:test_abc).and_return('ABCDEF')
      subject.test_abc.should == 'ABCDEF'
    end
  end
end
