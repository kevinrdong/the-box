class CreateDesigners < ActiveRecord::Migration[5.1]
  def change
    create_table :designers do |t|
      t.string :image
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
