class UnsignedController < ApplicationController
    def unsignedPage
        @one_user = User.find_by(id: current_user.id)
         @room = Study.all
    end
    
    def studyList
        @room = Study.all
    end
    
    
    def create
        newStudy = Study.new
        newStudy.studyName = params[:room_name]
        newStudy.stuNo = params[:num]
        newStudy.curNo = 0
        newStudy.certi = params[:certi]
        newStudy.stuMaster = current_user.email
        newStudy.save
        

        redirect_to controller: 'unsigned', action: 'stateChange', id: newStudy.id
    end
    
    def room_list
        list = Array.new
        #신청 = apply
        if apply == True
            list.push(current_user.email)
        end
    end
     
    def room_list
        list = Array.new
        apply_list = Array.new
        
        if list.count < room_limit
            apply_list.push(current_user.email)
        end
    end
    
    def stateChange
        #여기로 들어오면 지금 들어온 사람 아이디를 유저 목록에서 찾은 뒤
        #세션의 스터디 아이디와 디비상의 스터디 아이디를 모두 1로 변경시켜주고
        #메인으로 리다이렉트를 한다.
        #참가한 방의 방원 리스트에 현 사용자를 추가한다.


        user = User.find_by(id: current_user.id)
        
        # 방 번호가 0이면 참가 안한상태. 0이 아니면 참가 한 상대.
        
        
        if user.studyID == 0
            targetRoomID = params[:id]
            user.update(studyID: targetRoomID)
            #참가할 방의 참가 리스트에도 보여준다.
            memberList = Stulist.new
            memberList.nickname = user.name
            memberList.studyID = user.studyID
            memberList.studentID = user.id
            memberList.save
            # 참가할 방의 현 인원수도 1명을 늘려주고, 그로인해 그 방이 포화가 되었다면 isOpen을 false로 바꿔줌
            room = Study.find_by(id: targetRoomID)
            room.curNo = room.curNo+1
            if room.stuNo == room.curNo
                room.isOpen = false
            end
            room.save
            
        else
            #방 나갈땐, 유저가 있던 방의 사람수를 1명 빼준다. 개방 상태가 false면 공석이 생겼으므로 true로 바꿔줌 
            
            room = Study.find_by(id: user.studyID)
            room.curNo = room.curNo-1
            room.stuNo == room.curNo
            room.isOpen = true
            room.save
            
            #그런 뒤에 사용자 정보를 바꿔준다.
            user.update(studyID: 0)
            memberList=Stulist.find_by(studentID: current_user.id)
            memberList.destroy
        end
        
        
        
        redirect_to "/home/main"
    end
    
end
