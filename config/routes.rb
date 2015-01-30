# http://jberczel.github.io/members-only-walkthrough/

MembersOnly::Application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]
  
  # root path that directs to list of posts
  root 'posts#index'
  
  
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  # to create a blank session and send it to the view.
  def new
  end
  
  
  
  
end
