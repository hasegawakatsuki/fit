class AddAnnualFeeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :annual_fee, :integer
  end
end
