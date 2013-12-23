require "spec_helper"

describe "Displaying the homepage" do
  before do
    runner = create(:runner, :name => "Runner A", :hardware => "Pentium II 450 MHz")
    run = create(:run, :ruby_version => "1.9.2", :runner => runner)
    create(:result, :run => run, :benchmark => "n_queens", :score => 25)

    visit root_path
  end

  it "shows a welcome message" do
    page.should have_content "Welcome to Ruby Bench"
  end

  it "allows users to see average scores for a benchmark by Ruby version", :js => true do
    select "Runner A (Pentium II 450 MHz)", :from => "runner_id"
    select "n_queens", :from => "runner_benchmark"
    click_on "Display"

    page.should have_content "Showing results for n_queens which was run using Runner A (Pentium II 450 MHz)."
  end
end
