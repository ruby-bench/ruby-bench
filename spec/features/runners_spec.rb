require 'spec_helper'

describe "Displaying a runner" do
  before do
    runner = create(:runner, :name => "Runner A", :hardware => "Pentium II 450 MHz")
    run = create(:run, :ruby_version => "1.9.2", :runner => runner)
    create(:result, :run => run, :benchmark => "n_queens", :score => 25)

    visit runner_path(runner)
  end

  it "should show the runner" do
    page.should have_content "Runner A (Pentium II 450 MHz)"
  end

  it "allows users to select a result" do
    click_on "n_queens"
    page.should have_content "Showing results for n_queens which was run using Runner A (Pentium II 450 MHz)"
  end
end
