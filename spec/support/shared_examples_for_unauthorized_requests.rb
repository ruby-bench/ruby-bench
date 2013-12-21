shared_examples_for "an unauthorized request" do
  it "returns a 401 status" do
    expect(response.status).to eql(401)
  end
end
