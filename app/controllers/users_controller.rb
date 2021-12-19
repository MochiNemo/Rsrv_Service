class UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def account
    @user = current_user
  end
  
  def update
    @user = User.find(current_user)
    puts "aaaa"
    puts params[:introduction]
    if @user.update(user_profile)
      flash[:notice] = "プロフィールを更新しました"  
      redirect_to users_profile_path
    else
      render "show"
    end
  end

  private
  
    def user_profile
      params.require(:user).permit(:name, :image_name, :introduction)
    end

end
