class PostController < ApplicationController
  
  before_action :signed_in_user, only: [:new, :create]

    # before filter/action
    def signed_in_user
      unless signed_in?
        redirect_to signin_url
      end
    end
    
  def new
    @post = Post.new
  end
  
  # creates a new post with help from #post_params and 
  # also updates post's foreign key (user_id) with the signed user's id. 
  def create
    @post = Post.new(post_params)
    
    #current_user is a helper function.
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path


  def index
    @posts = Post.all
  end



end