class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :ssn, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_1, :string
    add_column :users, :street_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postal_code, :string
    add_column :users, :country_code, :string
    add_column :users, :middle_name, :string
    add_index :users, :ssn
  end
end
