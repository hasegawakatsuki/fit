class RemoveNameToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :age, :integer
    add_column :users, :birth_date, :date
  end
end
