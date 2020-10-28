class WelcomesController < ApplicationController 

  def show
    @first_name = params[:first_name]
  end

end