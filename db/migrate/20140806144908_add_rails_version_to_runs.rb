class AddRailsVersionToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :rails_version, :string
    add_column :runs, :rails_git_hash, :string
  end
end
