require "spec_helper"

describe "Receiving results" do
  describe "POST /api/v1/results" do
    let(:runner) { create(:runner) }
    let(:token) {{ "Authorization" => "Token token=\"#{runner.token}\"" }}

    let(:params) do
      {
        :run => {
          :ruby_version => "2.0.0-p247",
          :git_hash => "c0a04be8ddcadcd89c02bc135e4b288f6d936704",
          :date => "2013-12-18T12:09:16+00:00",
          :results_attributes => [
            { :benchmark => "some_bench", :score => 222 },
            { :benchmark => "another_bench", :score => 233 }
          ]
        }
      }
    end

    context "when valid data is provided" do
      let(:run) { runner.runs.first }

      before do
        post api_v1_results_path, params, token
      end

      it "returns a 204 status" do
        expect(response.status).to eql(204)
      end

      it "create a new run for the runner" do
        expect(runner.runs.count).to eq(1)
      end

      it "stores details of the run" do
        expect(run.ruby_version).to eq("2.0.0-p247")
        expect(run.git_hash).to eq("c0a04be8ddcadcd89c02bc135e4b288f6d936704")
        expect(run.date).to eq(DateTime.new(2013, 12, 18, 12, 9, 16))
      end

      it "creates a result for each benchmark score" do
        expect(run.results.count).to eq(2)
      end

      it "stores the benchmark scores" do
        expect(run.results.find_by(:benchmark => "some_bench").score).to eq(222)
        expect(run.results.find_by(:benchmark => "another_bench").score).to eq(233)
      end
    end

    context "when invalid data is provided" do
      context "when no runner token is provided" do
        before do
          post api_v1_results_path, params
        end

        it_behaves_like "an unauthorized request"
        it_behaves_like "an invalid run"
      end

      context "when runner token is invalid" do
        before do
          post api_v1_results_path, params, { "Authorization" => 'Token token="derp"' }
        end

        it_behaves_like "an unauthorized request"
        it_behaves_like "an invalid run"
      end

      context "when run details are invalid" do
        before do
          params[:run][:ruby_version] = ""
          post api_v1_results_path, params, token
        end

        it_behaves_like "an invalid request"
        it_behaves_like "an invalid run"
      end

      context "when run benchmarks are invalid" do
        before do
          params[:run][:results_attributes].first[:benchmark] = ""
          post api_v1_results_path, params, token
        end

        it_behaves_like "an invalid request"
        it_behaves_like "an invalid run"
      end

    end
  end
end
