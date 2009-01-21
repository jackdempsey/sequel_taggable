require File.dirname(__FILE__) + '/../spec_helper'

describe Sequel::Plugins::Taggable do
  
  describe "is :taggable" do
    class TaggableTestModel < Sequel::Model
      is :taggable
    end
    
    before do
      @taggable = TaggableTestModel.new
    end
    
    it "should respond to tag methods" do
      @taggable.should respond_to(:tags)
      @taggable.should respond_to(:add_tag)
      @taggable.should respond_to(:remove_tag)
      @taggable.should respond_to(:remove_all_tags)  
    end
    
    it "should create tags and taggings associations" do
      TaggableTestModel.associations.should include(:tags)
      TaggableTestModel.associations.should include(:taggings)
    end
    
  end

  describe "is :taggable, :on => (names)" do
    class TaggableOnTestModel < Sequel::Model
      is :taggable, :on => [:skills, :tags]
    end
    
    before do
      @taggable = TaggableOnTestModel.new
    end
    
    it "should respond to each tag type" do
      pending
      
      @taggable.should respond_to(:tags)
      @taggable.should respond_to(:skills)
    end
    
  end

end
