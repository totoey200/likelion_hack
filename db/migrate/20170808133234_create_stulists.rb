class CreateStulists < ActiveRecord::Migration
  def change
    create_table :stulists do |t|
      t.string :nickname
      t.integer :studentID
      t.integer :studyID
      t.timestamps null: false
    end
  end
end
