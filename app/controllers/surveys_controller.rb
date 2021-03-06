get '/surveys' do
  @survey = Survey.order(:created_at)
  erb :'survey/index'
end

get '/surveys/new' do
  erb :'survey/new'
end

get '/surveys/:id/end' do
  @survey = Survey.find_by(id: params[:id])
  erb :'survey/end'
end

post '/surveys' do
  @survey = Survey.new(params[:survey])
  if @survey.save
    if request.xhr?
      erb :'question/_new_partial', layout: false
    else
      redirect '/questions/new'
    end
  else
    erb :'/survey/new', layout: false, locals: { errors: @survey.errors.full_messages }
  end
end

get '/surveys/:id/statistics' do
  @survey = Survey.find_by(id: params[:id])
  @selection_id = []
  @survey.questions.each do |question|
    question.selections.each do |selection|
      @selection_id << selection.choice_id
    end
  end
  erb :'/survey/statistics'
end
