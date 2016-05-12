class AddDetailToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :detail, :text
  end
end
