class RemoveTelFromHospitals < ActiveRecord::Migration
  def change
    remove_column :hospitals, :tel, :integer
    add_column :hospitals, :tel, :string
  end
end
