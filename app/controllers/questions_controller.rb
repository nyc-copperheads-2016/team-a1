get '/surveys/:id/questions/:question_id' do
  survey = Survey.find_by(id: params[:id])
  @question = survey.questions.find_by(id: params[:question_id])
  @current_response = survey.responses.find_by(user_id: session[:user_id])
  erb :'question/show'
end
