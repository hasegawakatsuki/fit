class AddLogoUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :logo_url, :text
  end
end
