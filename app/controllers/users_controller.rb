class UsersController < ApplicationController
  def index
    @users = User.order(id: 'DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
    @user = @user.user_roles.build
  end

  def create

   @user = User.new(user_params)
   respond_to  do |format|
     if @user.save
       format.html {redirect_to new_role_path,notice:'User is created Successfully'}
     else
       format.html{render :new}
     end
   end
  end


  def user_role

  end
  private
  def user_params
   params.permit(:firname,:lastname,:email,user_roles_attributes:[:role_id])
  end
end
