require "spec_helper"

describe "Receiving results" do
  describe "POST /api/v1/results" do

    context "when no results data is provided" do
      it "returns a 400 status" do
        post api_v1_results_path, params = nil
        expect(response.status).to eql(400)
      end
    end

    context "when valid results data is provided" do
      let(:result_params) do
        {
          :result => {
            :runner_id => "abc123",
            :runner_hardware => "xeon xyz 32GB - 2.2GHZ",
            :ruby_version => "2.0.0-p247",
            :git_hash => "c0a04be8ddcadcd89c02bc135e4b288f6d936704",
            :run_date => "2013-12-18T12:09:16+00:00",
            :benchmarks => {
              :some_bench => 222,
              :some_other_bench => 223
            }
          }
        }
      end

      it "returns a 204 status" do
        post api_v1_results_path, result_params
        expect(response.status).to eql(204)
      end

      it "validates the results"
      it "stores the results"
    end

  end
end
