class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @courses = Course.all
    # unless @user == current_user
    #   redirect_to :back, :alert => "Access denied."
    # end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar, :baseline, :bio, :github, :website)
  end

end
