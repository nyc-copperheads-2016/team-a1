get '/choices/new' do
  survey = Survey.where(user_id: session[:user_id]).last
  @question = Question.where(survey_id: survey.id).last
  erb :'/choice/new'
end


post '/choices' do
  choice = Choice.new(params[:choices])
  @question = Question.find_by(id: choice.question_id)
  if choice.save
    if request.xhr?
      erb :'/choice/new', layout: false
    else
      redirect '/choices/new'
    end
  else
    @error = "Error creating choice"
    @question = Question.find_by(id: params[:choices][:question_id])
    erb :'/choice/new'
  end
end
