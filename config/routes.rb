Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'  
  get '/welcome(/:first_name)', to: 'static_pages#welcome', as: 'welcome'
  get '/home', to: 'static_pages#home'
  get '/home/:gossip', to: 'static_pages#gossip_page', as:'gossip'
  get '/gossip/:user', to: 'static_pages#user_page', as:'user'
end
