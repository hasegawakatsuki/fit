class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :string
    add_column :users, :age, :integer
  end
end
