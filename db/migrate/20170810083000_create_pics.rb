class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.integer :studyID
      t.string :stuMaster
      t.integer :studentID
      t.datetime :certiDate
      t.timestamps null: false
    end
  end
end
