class SignedController < ApplicationController
    #사인드에서는 회원가입된 사람만이 접근 가능.
    #지금 접속한 사용자가 방장이면 true를 리턴.
    #지금 접속한 사용자가 방장이 아니면 false를 리턴.
    
    def my_room
        @one_user = User.find_by(id: current_user.id)
        @room = Study.find_by(id: current_user.studyID)
        @masterMenu = ""
        
        if @room.stuMaster == current_user.name
            @masterMenu = current_user.studyID
        end
    end
    
    def memberList
        @room = @room = Study.find_by(id: current_user.studyID)
        @member = Stulist.where(studyID: current_user.studyID)
    end
    
    def certification
        newPic = Pic.new
        newPic.studyID = current_user.studyID
        newPic.stuMaster = Study.find_by(id: current_user.studyID).stuMaster
        newPic.studentID = current_user.id
        newPic.image = params[:image]
        newPic.certiDate = Date.today
        newPic.save
    end

    def masterPage
        
        
        
    end
end
