class RenameCustmerIdColuonToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :custmer_id, :customer_id
  end
end
