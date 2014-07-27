class AddBlockscoreIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blockscore_id, :string
    add_column :users, :blockscore_question_verified, :boolean, default: false
    add_column :users, :blockscore_last_question_set_id, :string
    add_index :users, :blockscore_id
    remove_index :users, :ssn
  end
end
