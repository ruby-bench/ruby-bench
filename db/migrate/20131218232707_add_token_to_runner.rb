class AddTokenToRunner < ActiveRecord::Migration
  def change
    add_column :runners, :token, :string

    add_index :runners, :token, unique: true
  end
end
