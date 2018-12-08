class RolesController < ApplicationController

  def new
   @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    respond_to  do |format|
      if @role.save
        format.html {redirect_to new_role_path,notice:'Role is created Successfully'}
      else
        format.html{render :new}
      end
    end
  end

  def hide_role
   @roles = Role.role_status
  end

  def update_roles
    Role.where(id: params[:status]).update_all(status: false)
    respond_to  do |format|
     format.html {redirect_to new_role_path,notice:'Hide Role is Updated Successfully'}
    end
  end

  private
   def role_params
    params.fetch(:role, {}).permit(:name)
   end
end
