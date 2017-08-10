class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.time :room_time
      t.integer :room_limit
      t.date :room_last
      t.string :certi #인증방법이래
      t.text :comment
      t.string :captain
      t.string :crew, :default => [].to_yaml
      t.timestamps null: false
    end
  end
end
