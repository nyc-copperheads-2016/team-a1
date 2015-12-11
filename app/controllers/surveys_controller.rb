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
