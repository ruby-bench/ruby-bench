class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :name
      t.string :hardware

      t.timestamps
    end

    add_index :runners, :name, unique: true
  end
end
