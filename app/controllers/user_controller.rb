class UserController < ApplicationController

  layout 'dashboard'

  def list
    @users = User.all
    authorize @users
  end

  def delete
    respond_to do |format|
      @user = User.find(params[:id])
      authorize @user
      @user.destroy
      format.html { redirect_to user_list_url, notice: "Xoá tài khoản thành công." }
    end
  end

end
