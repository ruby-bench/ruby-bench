require "spec_helper"

describe "Receiving results" do
  describe "POST /api/v1/results" do

    context "when valid data is provided" do
      let(:params) do
        {
          :runner => {
            :name => "new_runner",
            :hardware => "xeon xyz 32GB - 2.2GHZ"
          },
          :details => {
            :ruby_version => "2.0.0-p247",
            :git_hash => "c0a04be8ddcadcd89c02bc135e4b288f6d936704",
            :run_date => "2013-12-18T12:09:16+00:00"
          },
          :benchmarks => {
            :some_bench => 222,
            :some_other_bench => 223
          }
        }
      end

      context "when the runner is new" do
        let(:new_runner) { Runner.find_by(:name => "new_runner") }

        before do
          post api_v1_results_path, params
        end

        it "returns a 204 status" do
          expect(response.status).to eql(204)
        end

        it "creates a new runner" do
          expect(new_runner).to_not be_nil
        end

        it "stores the runner hardware" do
          expect(new_runner.hardware).to eq("xeon xyz 32GB - 2.2GHZ")
        end

        it "stores the results" do
          pending
        end
      end

      context "when the runner has already posted results" do
        let!(:existing_runner) { create(:runner, :name => "existing_runner") }

        before do
          params[:runner][:name] = "existing_runner"
          post api_v1_results_path, params
        end

        it "does not create a new runner" do
          expect(Runner.count).to eq(1)
        end

        it "updates the runner hardware" do
          expect(existing_runner.reload.hardware).to eq("xeon xyz 32GB - 2.2GHZ")
        end
      end

    end

    context "when invalid data is provided" do
      let(:params) do
        { :runner => { :name => "" } }
      end

      before do
        post api_v1_results_path, params
      end

      it "returns a 422 status" do
        expect(response.status).to eql(422)
      end

      it "returns the error messages" do
        expect(json_response).to include("errors")
      end
    end

  end
end
