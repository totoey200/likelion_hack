class CreateMemolists < ActiveRecord::Migration
  def change
    create_table :memolists do |t|
      t.string :studyID     #공부방 아이디
	    t.string :memoName   #메모한 사람
	    t.string :memoContent   #메모한 내용
	    t.timestamps null: false
    end
  end
end
