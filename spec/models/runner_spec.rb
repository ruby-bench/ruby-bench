require 'spec_helper'

describe Runner do
  describe "validation" do
    it "is valid with valid attributes" do
      expect(build(:runner)).to be_valid
    end

    describe "token" do
      it "must be unique" do
        runner = create(:runner)
        expect(build(:runner, :token => runner.token)).to_not be_valid
        expect(build(:runner, :token => runner.token.upcase)).to_not be_valid
      end

      it "cannot be blank" do
        expect(build(:runner, :token => nil)).to_not be_valid
      end
    end

    describe "name" do
      it "must be unique" do
        runner = create(:runner)
        expect(build(:runner, :name => runner.name)).to_not be_valid
        expect(build(:runner, :name => runner.name.upcase)).to_not be_valid
      end

      it "cannot be blank" do
        expect(build(:runner, :name => nil)).to_not be_valid
      end
    end

    describe "hardware" do
      it "cannot be blank" do
        expect(build(:runner, :hardware => nil)).to_not be_valid
      end
    end

  end
end
