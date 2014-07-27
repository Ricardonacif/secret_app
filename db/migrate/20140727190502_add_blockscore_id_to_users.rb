class AddBlockscoreIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blockscore_id, :integer
    add_index :users, :blockscore_id
    remove_index :users, :ssn
  end
end
