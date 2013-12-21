require 'spec_helper'

describe Result do
  describe "validation" do
    it "is valid with valid attributes" do
      expect(build(:result)).to be_valid
    end

    describe "benchmark" do
      it "cannot be blank" do
        expect(build(:result, :benchmark => nil)).to_not be_valid
      end
    end

    describe "score" do
      it "cannot be blank" do
        expect(build(:result, :score => nil)).to_not be_valid
      end
    end
  end
end
