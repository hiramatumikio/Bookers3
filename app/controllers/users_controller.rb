class UsersController < ApplicationController

before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

def index
  @users = User.all
  @book = Book.new
  end

  def show
  @users = User.all
  @book = Book.new
    @user = User.find(params[:id])
  @books = Book.where(user_id: @user.id)

  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'successfully'
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
  end

   private

  def user_params

      params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
