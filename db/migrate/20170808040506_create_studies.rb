class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :studyName   #공부방 이름
	  t.datetime :mDate     #공부방 생성날짜
	  t.integer :stuNo      #학생수
	  t.string :stuMaster   #방장
	  t.integer :studyID    #공부방 인덱스
	  t.string :certi       #인증방법이래
	  t.timestamps null: false
    end
  end
end
