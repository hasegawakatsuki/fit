class AddAccessToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :access, :text
  end
end
