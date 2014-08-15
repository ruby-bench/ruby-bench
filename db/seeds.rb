# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
runner = Runner.create name: "Bolt 1", hardware: "xeon xyz 32GB - 2.2GHZ", token: 123

Run.create(
  "runner_id"       => runner.id,
  "ruby_version"    => "2.0.0p353",
  "git_hash"        => "609cdd3236dff10405453fe2e201ce615ce203b4",
  "rails_version"   => "4.0.0",
  "rails_git_hash"  => "7c4bfe",
  "date"            =>  "2013-12-18T12 => 09 => 16+00 => 00",
  "results_attributes" => [
    {"benchmark" => "some_bench", "score" => "222"}
  ]
)

Run.create({
  "runner_id"       => runner.id,
  "ruby_version"    => "2.1.0-p247",
  "git_hash"        => "c0a04be8ddcadcd89c02bc135e4b288f6d936714",
  "rails_version"   => "4.0.0",
  "rails_git_hash"  => "7c4bfe",
  "date"            =>  "2014-01-18T12 => 09 => 16+00 => 00",
  "results_attributes" => [
    {"benchmark" => "some_bench", "score" => "4222"}
  ]
})
