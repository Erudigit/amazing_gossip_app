class StaticPagesController < ApplicationController 

  def welcome
    @first_name = params[:first_name]
  end
  
  def team
  end

  def contact
  end

  def home
  end

  def gossip_page
    @gossip = Gossip.find(params[:gossip])
    @user = User.find(@gossip.user_id)
  end

  def user_page
    @user = User.find(params[:user])
  end

end