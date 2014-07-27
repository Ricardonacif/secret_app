class PagesController < ApplicationController
  
  before_action :authenticate_user!, :check_if_completed_verification, only: [:secret]
  
  def home
    
  end

  def secret
    
  end
  
  protected

  def check_if_completed_verification
    redirect_to questions_path unless current_user.completed_verification?
  end
end