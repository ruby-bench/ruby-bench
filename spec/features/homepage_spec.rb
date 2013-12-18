require "spec_helper"

describe "Displaying the homepage" do
  it "shows a welcome message" do
    visit root_url
    page.should have_content "Welcome to Ruby Bench"
  end
end
