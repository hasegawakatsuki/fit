class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :place
      t.integer :tel
      t.text :detail
      t.string :homepage
      t.text :image
      t.timestamps
    end
  end
end
