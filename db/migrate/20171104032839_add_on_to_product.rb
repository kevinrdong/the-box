class AddOnToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :products,:shelve,:boolean, default: true
  end
end
