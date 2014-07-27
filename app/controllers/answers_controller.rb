class AnswersController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    answers = params[:answers].map { |k,v| {question_id: k, answer_id: v}}
    score = current_user.get_score_on_question_set_answers(answers)
    if score > 80
      current_user.update_attribute(:blockscore_question_verified, true)
      flash[:success] =  "Yup! You got access to the secret with a score of #{score.to_i}! :D "
      redirect_to secret_path
    else
      redirect_to questions_path, alert: "You have to score at least 60 to see the secret. You got only #{score.to_i} :("
    end
  end
  
end