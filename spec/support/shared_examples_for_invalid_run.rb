shared_examples_for "an invalid run" do
  it "does not create the run" do
    expect(Run.count).to eq(0)
  end

  it "does not create any benchmark results" do
    expect(Result.count).to eq(0)
  end
end
