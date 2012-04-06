require 'spec_helper'

describe Activity do

  before(:each) do
    @attr = { 
      :user => 1,
      :last_login => Time.now,
      :last_activity => Time.now
    }
  end

  describe "" do
    before(:each) do
      @activity = Activity.create!(@attr)
    end

    it "should have a user attribute" do
      @activity.should respond_to(:user)
    end

    it "should have a last_login attribute" do
      @activity.should respond_to(:last_login)
    end

    it "should have a last_activity attribute" do
      @activity.should respond_to(:last_activity)
    end

  end

end
