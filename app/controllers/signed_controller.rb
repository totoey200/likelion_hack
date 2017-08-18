class SignedController < ApplicationController
    #사인드에서는 회원가입된 사람만이 접근 가능.
    #지금 접속한 사용자가 방장이면 true를 리턴.
    #지금 접속한 사용자가 방장이 아니면 false를 리턴.
    
    def my_room
        @one_user = User.find_by(id: current_user.id)
        $room = Study.find_by(id: current_user.studyID)
        $member = Stulist.where(studyID: current_user.studyID)
        $memoBoard = Memolist.where(studyID: current_user.studyID).order("created_at DESC")
        @masterMenu = ""
        @notice = Notice.where(studyID: current_user.studyID)
        
        
        
        
        if $room.stuMaster == current_user.name
            @masterMenu = current_user.studyID
        end
    end
    
    def memberList
        
    end
    
    def certification
        newPic = Pic.new
        newPic.studyID = current_user.studyID
        newPic.stuMaster = Study.find_by(id: current_user.studyID).stuMaster
        newPic.studentID = current_user.id
        newPic.image = params[:image]
        newPic.certiDate = Date.today
        newPic.save
        
        redirect_to "/signed/my_room"
    end

    def punishment
        target = User.find_by(name: params[:name])
        target.ransome = target.ransome+(params[:money].to_i)
        target.save
        
        redirect_to "/signed/my_room"
    end
    
    def notice
        newnotice = Notice.new
        newnotice.content = params[:content]
        newnotice.save
        
        redirect_to "signed/my_room"
    end

    def memoWrite
        newMemo = Memolist.new
        newMemo.studyID = current_user.studyID
        newMemo.memoName = current_user.name
        newMemo.memoContent = params[:content]
        newMemo.save
        
        redirect_to "/signed/my_room"
    end
    
    def minus_parti #성취도 차감
        parti = 100

    #만약, 1회 인증 못했을 경우, 0~100으로 제한.
    #만약 출석 못했을 경우, 
    #parti 값에 대한 id 정보 불러오고
    #check == 달력에 인증되는 내용이라 가정
        while parti == true
            if check == false
                parti -= 5
                break if parti == 0
        #출석 했을 경우,
            elsif check == true
                parti += 3
                continue if parti == 100
            end
        end
    end
                
    #단, parti의 최댓값은 100
    
    
end
