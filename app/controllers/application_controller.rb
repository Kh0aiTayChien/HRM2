class ApplicationController < ActionController::Base
  include Pundit
  # def after_sign_in_path_for(resource)
  #   if current_user.has_role?(:admin)
  #     dashboard_path
  #   elsif current_user.has_role?(:student)
  #     root_path
  #   end
  # end
end
