require File.dirname(__FILE__) + '/spec_helper'

describe "sequel_taggable" do
  before do
    @example = ExampleModel.new
  end
  
  it "should give models a #tags method" do
    @example.should respond_to(:tags)
  end
  
  describe  
  it "should give models a #tags method" do
    @example.should respond_to(:tags)
  end
  
  it "should give models a #tags= method" do
    @example.should respond_to(:tags=)
  end

  it "should give models a #<< method" do
    @example.should respond_to(:<<)
  end
  
  it "should save a models tags" do
    
  end
end