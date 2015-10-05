class HomeController < ApplicationController
  def index
  	@users=User.all
  end

  def search
  	@users = User.search(params[:query])
    render "result"
  end
end
