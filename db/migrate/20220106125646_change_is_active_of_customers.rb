class ChangeIsActiveOfCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :is_active, :boolean, default: true
  end
  
  def down
    change_column :customers, :is_active, :boolean
  end
end
