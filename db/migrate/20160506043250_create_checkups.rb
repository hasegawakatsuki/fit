class CreateCheckups < ActiveRecord::Migration
  def change
    create_table :checkups do |t|
      t.integer :hospital_id
      t.string :name
      t.text :detail
      t.integer :price
      t.timestamps
    end
  end
end
