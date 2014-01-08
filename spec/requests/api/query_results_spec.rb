require 'spec_helper'

describe "Querying results" do
  let(:headers) {{ "Accept" => "application/json,application/vnd.ruby_bench;ver=1" }}

  describe "GET API /api/results" do
    before do
      run = create(:run, ruby_version: '2.1.0')
      create(:result, run: run)
    end

    context "with a specified runner" do
      let(:runner)  { create(:runner) }
      let(:run)     { create(:run, runner: runner, ruby_version: '2.0.0') }

      before do
        create(:result, run: run, score: 11.0)
        get api_results_path, {runner_id: runner.to_param, format: :json}, headers
      end

      it "returns a 200 status" do
        expect(response.status).to eql(200)
      end

      it "returns the data as json" do
        expect(response.body).to eql('{"2.0.0":"11.0"}')
      end
    end

    context "without a specified runner" do
      before do
        get api_results_path, {format: :json}, headers
      end

      it "returns a 200 status" do
        expect(response.status).to eql(200)
      end

      it "returns the data as json" do
        expect(response.body).to eql('{"2.1.0":"9.99"}')
      end

    end
  end

  describe "GET API /api/results/1" do

    context "with a specified runner" do
      let(:result)  { create(:result, run: run, score: 15.5) }
      let(:runner)  { create(:runner) }
      let(:run)     { create(:run, runner: runner, ruby_version: '2.0.0') }

      before do
        get api_result_path(result), {runner_id: runner.to_param, format: :json}, headers
      end

      it "returns a 200 status" do
        expect(response.status).to eql(200)
      end

      it "returns the data as json" do
        expect(response.body).to eql('{"2.0.0":"15.5"}')
      end
    end

    context "without a specified runner" do
      let(:result)  { create(:result, run: run) }
      let(:run)     { create(:run, ruby_version: '2.1.0') }

      before do
        get api_result_path(result), {format: :json}, headers
      end

      it "returns a 200 status" do
        expect(response.status).to eql(200)
      end

      it "returns the data as json" do
        expect(response.body).to eql('{"2.1.0":"9.99"}')
      end

    end
  end
end
