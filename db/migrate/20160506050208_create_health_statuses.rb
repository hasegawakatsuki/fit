class CreateHealthStatuses < ActiveRecord::Migration
  def change
    create_table :health_statuses do |t|
      t.integer :user_id
      t.string :medical_history
      t.string :illness
      t.integer :weight
      t.integer :height
      t.integer :blood_pressure
      t.integer :fat_percentage
      t.timestamps
    end
  end
end
