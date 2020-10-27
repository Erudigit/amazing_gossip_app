class GossipsController < ApplicationController 
  def new
    @gossip = Gossip.new
  end

  def create

    @gossip = Gossip.new('title' => params[:title], 'content'=> params[:content], user_id: 11)
    
    if @gossip.save
      puts "saved"
      redirect_to home_path, :notice => 'Mefait accompli'
    else
      puts "hmmm...ca n'a pas fonctionne,essaie encore"
      puts @gossip.errors.messages
      render 'new'
    end

  end

end
