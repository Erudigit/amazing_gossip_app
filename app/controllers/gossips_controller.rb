class GossipsController < ApplicationController 
 
  def index
    @gossips = Gossip.all 
  end

  
  def show
    @gossip = Gossip.find(params[:id])
  end
   
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(post_params, user_id: 11)
    
    if @gossip.save
      puts "saved"
      redirect_to home_path, :notice => 'Mefait accompli'
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
    params.require(:gossip).permit(:title, :content)
  end


end
 