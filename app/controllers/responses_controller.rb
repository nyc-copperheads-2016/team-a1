post '/responses' do
  response = Response.new(params[:response])
  # binding.pry
  if response.save
    redirect "/surveys/#{response.survey_id}/questions/#{response.survey.questions.first.id}"
  else
    @survey = Survey.order(:created_at)
    @errors =  "You can only complete each survey once!"
    erb :'/survey/index'
  end
end
# !Response.exists?(params[:response]) &&
