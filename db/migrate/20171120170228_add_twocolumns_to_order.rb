class AddTwocolumnsToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders,:done,:boolean,default: false
  	add_column :orders,:deliver_number,:string
  end
end
