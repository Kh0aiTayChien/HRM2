class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized

  private

  def employee_not_authorized
    flash[:alert] = "Bạn không có quyền truy cập"
    redirect_to authenticated_root_path
  end

end
