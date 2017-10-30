class ChangePicturesToJson < ActiveRecord::Migration[5.1]
  def change
  	change_column :products,:pictures,:json
  end
end
