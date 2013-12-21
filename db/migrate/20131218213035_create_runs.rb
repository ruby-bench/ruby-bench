class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :ruby_version
      t.string :git_hash
      t.datetime :date
      t.references :runner, index: true

      t.timestamps
    end
  end
end
