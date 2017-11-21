class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.boolean :working,defalut: true
      t.timestamps
    end
  end
end
