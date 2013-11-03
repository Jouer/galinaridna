class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def index
  end

   def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Votre courrier est cree!"
      redirect_to admin_path
    else
      @feed_items = []
      render 'sessions/menu'
    end
  end

  def destroy
  	 @micropost.destroy
     redirect_to admin_path
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to admin_path if @micropost.nil?
    end
end