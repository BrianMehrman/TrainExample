require 'spec_helper'

describe Train do
  context "should validate uniquness on" do
    before(:each)do
      @train1 = FactoryGirl.create(:train)
      @train2 = FactoryGirl.build(:train)
      @train2.save
    end
    it "train_line" do
      expect(@train2.errors_on(:train_line)).to include("has already been taken")
    end
  end
end
