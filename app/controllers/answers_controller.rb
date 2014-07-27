class AnswersController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    answers = params[:answers].map { |k,v| {question_id: k, answer_id: v}}
    if current_user.get_score_on_question_set_answers(answers) > 80
      current_user.update_attribute(:blockscore_question_vefiried, true)
      flash[:success] =  "Yup! You got access to the secret :D"
      redirect_to secret_path
    else
      redirect_to questions_path, alert: "You have to score at least 60 to see the secret."
    end
  end
  
end