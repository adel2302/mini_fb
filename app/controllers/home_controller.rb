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
  
  end
end
