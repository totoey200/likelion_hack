class UnsignedController < ApplicationController
    def create
        newRoom = Room.new
        newRoom.room_name = params[:room_name]
        newRoom.room_limit = params[:num]
        newRoom.certi = params[:certi]
        newRoom.captain = current_user.email
        newRoom.save
        redirect_to "/home/index"
    end
    
    def room_list
        
    
    end
end
