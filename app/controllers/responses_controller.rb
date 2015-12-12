post '/responses' do
  response = Response.new(params[:response])
  if response.save
    redirect "/surveys/#{response.survey_id}/questions/#{response.survey.questions.first.id}"
  else
    redirect '/?errors=unable_to_initialize_survey'
  end
end
