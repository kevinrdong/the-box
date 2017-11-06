class AddIdToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products,:designer_id,:integer
  end
end
