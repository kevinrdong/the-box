class ChangePicturesIntoString < ActiveRecord::Migration[5.1]
  def change
  	change_column :products,:pictures,:string
  	
  end
end
