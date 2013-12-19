shared_examples_for "an invalid request" do
  it "returns a 422 status" do
    expect(response.status).to eql(422)
  end

  it "returns the error messages" do
    expect(json_response).to include("errors")
  end
end