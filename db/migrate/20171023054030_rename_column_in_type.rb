class RenameColumnInType < ActiveRecord::Migration[5.1]
  def change

  	rename_column :types,:type,:name

  end
end
