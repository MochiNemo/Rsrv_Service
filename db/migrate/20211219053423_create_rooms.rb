class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.integer :price
      t.string :address
      t.string :room_image

      t.timestamps
    end
  end
end
