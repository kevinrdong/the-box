class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.string :banner1	
      t.string :banner2
      t.string :banner3
      t.timestamps
    end
  end
end
