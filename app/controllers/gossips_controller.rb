
class GossipsController < ApplicationController 
 
  def index
    @gossips = Gossip.all 
  end

  

  def show
    @gossip = params[:id]
    @gossip_id = Gossip.find(params[:id])
    @get_city_name = City.find(@gossip_id.user.city_id).name
  end
   
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(post_params)
    @gossip.user = User.find_by(id: session[:user_id])
    
    if @gossip.save
      puts "saved"
      redirect_to gossips_path, :notice => 'Mefait accompli'
    else
      puts "hmmm...ca n'a pas fonctionne,essaie encore"
      puts @gossip.errors.messages
      render 'new'
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(post_params)
    redirect_to gossips_path
  end 

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def post_params
    params.permit(:title, :content)
  end
      
  def authenticate_user
      unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
      end
  end


end