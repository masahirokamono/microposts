class UsersController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end  
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end

  def index_path
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  
  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :city, :age, :job, :profilecomment,
                                 :password_confirmation)
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url if @user != current_user
  end  
  
end