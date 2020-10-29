class UsersController < ApplicationController

  def index 
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(post_params)
    
    if @user.save
      puts "saved"
      redirect_to gossips_path, :notice => 'Mefait accompli'
    else
      puts "hmmm...ca n'a pas fonctionne,essaie encore"
      puts @user.errors.messages
      render 'new'
    end

  end

  private

  def post_params
    params.permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
  end


end