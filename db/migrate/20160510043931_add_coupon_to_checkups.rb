class AddCouponToCheckups < ActiveRecord::Migration
  def change
    add_column :checkups, :coupon, :text
  end
end
