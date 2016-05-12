class AddAccessToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :access, :text
  end
end
