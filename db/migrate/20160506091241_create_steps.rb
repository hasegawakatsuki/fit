class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :user_id
      t.integer :step_num
      t.string :training
      t.timestamps
    end
  end
end
