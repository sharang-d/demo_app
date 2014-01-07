class MicropostsController < ApplicationController
  
  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(post_params)
    if @micropost.save
      redirect_to @micropost
    else
      render 'new'
    end
  end

  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to users_path
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(post_params)
      redirect_to @micropost
    else
      render 'edit'
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  private
  def post_params
    params.require(:micropost).permit(:content, :user_id)
  end


end
