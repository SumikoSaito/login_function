class UsersController < ApplicationController
  skip_before_action :require_log_in!, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    # binding.pry
    @user = User.find(params[:id])
    @favorite_blogs = @user.favorites
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def self.new_remember_token
      SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
