require "spec_helper"

describe "Receiving results" do
  describe "POST /api/v1/results" do
    context "when no results data is provided" do
      it "returns a 400 status" do
        post api_v1_results_path, params = nil
        expect(response.status).to eql(400)
      end
    end
  end
end