class RemoveAnnualFeeFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :annual_fee, :integer
    add_column :companies, :entrance_fee, :integer
  end
end
