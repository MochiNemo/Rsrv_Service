class RoomsController < ApplicationController
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    puts @room
    if @room.save
      flash[:notice] = "部屋の登録が完了しました"  
      redirect_to @room
    else
      flash[:alert] = "必須項目を入力してください"
      render "new"
    end
  end
  
  
  def show_rooms
    @rooms = current_user.rooms
  end
  
  def show
      @room = Room.find(params[:id])
      @rsrv = Rsrv.new
  end
  
  def confirm
    @rsrv = Rsrv.new(rsrv_params)
    @room = Room.find(params[:rsrv][:room_id])
    if @rsrv.invalid?
			render "show"
		else
		  @totaldate = (@rsrv.end_date - @rsrv.start_date) / 1.days
      @rsrv.price = @totaldate * @rsrv.person_num * @room.price
    end
  end
  
  def back
    @rsrv = Rsrv.new(rsrv_params)
    @room = Room.find(params[:rsrv][:room_id])
		render "show"
  end
  
  def complete
    @rsrv = Rsrv.create!(rsrv_params)
    @room = Room.find(params[:rsrv][:room_id])
    flash[:notice] = "予約が完了しました"  
  end
  
  def search
    puts "aaaaaaaa"
    puts params[:area]
    puts params[:keyward]
    puts "aaaaaaaa"
    @rooms = Room.where("address like?", "%#{params[:area]}%").where("introduction like? or name like?", "%#{params[:keyward]}%", "%#{params[:keyward]}%")
    @count = Room.where("address like?", "%#{params[:area]}%").where("introduction like? or name like?", "%#{params[:keyward]}%", "%#{params[:keyward]}%").count
  end
  
  private

  
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :room_image)
  end
  
  def rsrv_params
    params.require(:rsrv).permit(:start_date, :end_date, :person_num, :user_id, :room_id, :price)
  end
  
end
