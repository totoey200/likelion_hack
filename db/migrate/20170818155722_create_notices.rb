class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :studyID     #공부방 아이디
      t.string :content     #내용
      t.timestamps null: false
    end
  end
end
