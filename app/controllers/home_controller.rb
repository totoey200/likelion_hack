class HomeController < ApplicationController
  def index
  
  #로그인 체크 후 맞으면 메인페이지로 이동. 아니면 로그인 계속 무한반복.
    if user_signed_in?
      redirect_to "/home/main"
    #추후 에러페이지 송출
    end
  end
  
  
  
  def main
    #이 페이지로 넘어온 세션값을 보고, 이사람의 아이디를 디비에서 조회해서,
    #studyID가 0이 아니면 (참가한 곳이 있으면)signed로 리다이렉트
    #studyID가 초기값(0)이면, (참가한 곳이 없으면)unsigned로 리다이렉트
    if current_user.studyID == 0
      redirect_to "/unsigned/unsignedPage"
    else
      redirect_to "/signed/my_room"
    end
  end
end
