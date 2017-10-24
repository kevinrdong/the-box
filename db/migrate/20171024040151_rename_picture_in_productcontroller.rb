class RenamePictureInProductcontroller < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products,:picture,:pictures
  end
end
