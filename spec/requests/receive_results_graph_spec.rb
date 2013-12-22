require "spec_helper"

describe "Receiving results graph javascript" do
  describe "GET /runners/{id}" do
    let(:runner) { create(:runner) }
    let(:params) { { :runner => { :benchmark => "some_bench" } } }

    it "renders the show template" do
      xhr :get, runner_path(runner, :format => :js), params
      expect(response).to render_template(:show)
    end
  end
end