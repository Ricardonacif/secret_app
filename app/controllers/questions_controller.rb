class QuestionsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @questions = current_user.get_questions_set
  end
  
end