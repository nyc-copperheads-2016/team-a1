get '/surveys/:id/questions/:question_id' do
  survey = Survey.find_by(id: params[:id])
  @question = survey.questions.find_by(id: params[:question_id])
  @current_response = survey.responses.find_by(user_id: session[:user_id])
  erb :'question/show'
end

get '/questions/new' do
  @survey = Survey.where(user_id: session[:user_id]).last
  erb :'/question/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  @survey = Survey.where(user_id: session[:user_id]).last
  if @question.save
    if request.xhr?
      erb :'/choice/new', layout: false
    else
      redirect '/choices/new'
    end
  else
    redirect '/?errors=cannot_create_question'
  end
end
