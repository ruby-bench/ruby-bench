require "spec_helper"

describe "Displaying the homepage" do
  before do
    runner = create(:runner, :name => "Runner A", :hardware => "Pentium II 450 MHz")
    visit root_path
  end

  it "shows a welcome message" do
    page.should have_content "Welcome to Ruby Bench"
  end

  it "allows users to select a runner" do
    click_on "Runner A (Pentium II 450 MHz)"
    page.should have_content "Select a benchmark"
  end
end
