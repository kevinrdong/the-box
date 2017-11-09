class AddNowToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products,:available,:integer, default: 1
  end
end
