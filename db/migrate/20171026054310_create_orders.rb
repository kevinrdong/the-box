class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user , index:true
      t.integer :pay, default: 1
      t.timestamps
    end
  end
end
