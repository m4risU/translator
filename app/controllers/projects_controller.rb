class ProjectsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :add_user

  private
  def add_user
    params[:project].merge!({:user_id => current_user.id}) if params[:project].present?
  end
  
end