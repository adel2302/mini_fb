class HomeController < ApplicationController
	autocomplete :user, :name

  def index
  	@users = User.all
  	@messages = Message.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def search
  	@users = User.search(params[:query])
    render "result"
  end

  def create
     Friend.create user_a_id: current_user.id, user_b_id: params[:id]
      redirect_to "/"
  end

  def destroy_friend
    Friend.find(params[:id]).destroy
    redirect_to "/"
  end
  
end