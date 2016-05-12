class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.integer :user_id
      t.integer :fee
      t.timestamps
    end
  end
end
