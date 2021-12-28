class CreateRsrvs < ActiveRecord::Migration[5.0]
  def change
    create_table :rsrvs do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :person_num
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
