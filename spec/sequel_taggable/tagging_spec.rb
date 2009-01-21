require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Tagging do
  before(:each) do
    @tagging = Tagging.new(:tag_id => 1, :taggable_id => 1, :taggable_type => "TaggedModel")
  end

  it "should have properties: id, tag_id, taggable_id, taggable_type, taggable_id and taggable_type" do
    @tagging.should respond_to(:id)
    @tagging.should respond_to(:tag_id)
    @tagging.should respond_to(:taggable_id)
    @tagging.should respond_to(:taggable_type)
  end

  it "should validate the presence of tag_id, taggable_id and taggable_type" do
    @tagging.should be_valid
    
    Tagging.new(:taggable_id => 1, :taggable_type => "TaggedModel").should_not be_valid

    Tagging.new(:tag_id => 1, :taggable_type => "TaggedModel").should_not be_valid

    Tagging.new(:tag_id => 1, :taggable_id => 1).should_not be_valid   
  end
  
  it "should have and require and tag_context" do
    pending
    @tagging.should respond_to(:tag_context)
    @tagging.tag_context =  nil
    @tagging.should_not be_valid
  end

  it "should many_to_one :tag" do
    Tagging.associations.should include(:tag)
    Tagging.association_reflection(:tag)[:class_name].should == "Tag"
  end

  it "should have a method Tagging#taggable which returns the associated taggable instance" do
    @tagging.should respond_to(:taggable)
    @tagging.taggable.should_not be
    @tagging.taggable_id = 11111
    @tagging.taggable_type = "TaggedModel"
    TaggedModel.should_receive(:get!).with(11111)
    @tagging.taggable
  end
end
