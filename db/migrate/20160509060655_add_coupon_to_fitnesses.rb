class AddCouponToFitnesses < ActiveRecord::Migration
  def change
    add_column :fitnesses, :coupon, :text
  end
end
