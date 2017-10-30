class CreateOrderedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_items do |t|
      t.belongs_to :order , index:true
      t.belongs_to :product , index:true
      t.integer :quantities, default:1

      t.timestamps
    end
  end
end
