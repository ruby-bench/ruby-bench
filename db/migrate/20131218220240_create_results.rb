class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :benchmark
      t.decimal :score, :default => 0.0
      t.references :run, index: true

      t.timestamps
    end
  end
end
