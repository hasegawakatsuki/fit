class AddImageUrlToFitnesses < ActiveRecord::Migration
  def change
    add_column :fitnesses, :image_url, :text
  end
end
