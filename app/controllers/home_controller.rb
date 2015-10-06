class HomeController < ApplicationController
	autocomplete :user, :name

  def index
  	@users = User.all
  	@messages = Message.all
  end
  
  def show
    @user = User.find(params[:id])
    @my_friends = User.where(id: current_user.friends.map{|v| [v.user_b_id]})
    @my_friends.each do |f|
     if f.id == @user.id
       @we_are_friends = 1
     end
   end 
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