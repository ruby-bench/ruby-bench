require 'spec_helper'

describe Run do
  describe "validation" do
    it "is valid with valid attributes" do
      expect(build(:run)).to be_valid
    end

    describe "ruby_version" do
      it "cannot be blank" do
        expect(build(:run, :ruby_version => nil)).to_not be_valid
      end
    end

    describe "date" do
      it "cannot be blank" do
        expect(build(:run, :date => nil)).to_not be_valid
      end
    end
  end
end
