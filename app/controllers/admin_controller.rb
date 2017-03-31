class AdminController < ApplicationController
  before_action :authenticate_role
  def index
    @users = User.all
    @posts = Post.all
  end

  private

  def authenticate_role
    if current_user.user_type != "admin"
      redirect_to root_path, notice: 'Please Fuck off.'
    end
  end
end
