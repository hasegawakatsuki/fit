class CreateFitnesses < ActiveRecord::Migration
  def change
    create_table :fitnesses do |t|
      t.integer :company_id
      t.string :name
      t.text :detail
      t.integer :price
      t.string :place
      t.timestamps
    end
  end
end
