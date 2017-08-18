class CreateStulists < ActiveRecord::Migration
  def change
    create_table :stulists do |t|
      #학생 리스트.
      t.string :nickname
      t.integer :studentID
      t.integer :studyID
      t.timestamps null: false
    end
  end
end
