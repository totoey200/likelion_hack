class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :studyName   #공부방 이름
	  t.datetime :mDate     #공부방 생성날짜
	  t.integer :stuNo      #학생수
	  t.integer :curNo      #지금 학생수
	  t.boolean :isOpen,    default: true  #모집중인지
	  t.string :stuMaster   #방장
	  t.integer :studyID    #공부방 인덱스
	  t.string :certi       #인증방법이래
	  t.text :rules					#지켜야하는 룰
	  t.timestamps null: false
    end
  end
end
