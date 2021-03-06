get '/surveys/:id/questions/:question_id' do
  survey = Survey.find_by(id: params[:id])
  @question = survey.questions.find_by(id: params[:question_id])
  @current_response = survey.responses.find_by(user_id: session[:user_id])
  erb :'question/show'
end

get '/questions/new' do
  @survey = Survey.where(user_id: session[:user_id]).last
  if request.xhr?
    erb :'/question/_question_partial', layout: false
  else
    erb :'/question/new'
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  @survey = Survey.where(user_id: session[:user_id]).last
  if @question.save
    if request.xhr?
      erb :'/choice/_new_partial', layout: false
    else
      redirect '/choices/new'
    end
  else
    redirect '/?errors=cannot_create_question'
  end
end
