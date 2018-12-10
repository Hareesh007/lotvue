class UsersController < ApplicationController
  def index
    @users = User.order(id: 'DESC').paginate(page: params[:page], per_page: 1)
  end

  def new
    @user = User.new
  end

  def create
   role_ids = User.format_ids(params[:user][:role_id])
   @user = User.new(user_params)
   respond_to  do |format|
     if @user.save
       @user.update(role_id: role_ids)
       format.html {redirect_to new_role_path,notice:'User is created Successfully'}
     else
       format.html{render :new}
     end
   end
  end

  def ajax_user
   @users = User.unassigned_users.paginate(page: params[:page], per_page: 1)
  end

  def user_filter
   @users = User.user_filter(params[:role_id]).paginate(page: params[:page], per_page: 1)
  end

  def user_role

  end
  private
  def user_params
   params.fetch(:user, {}).permit(:firname,:lastname,:email,:role_id)
  end
end
