post '/responses' do
  response = Response.new(params[:response])

  if response.save
    redirect "/survey/#{response.survey_id}/questions/1"
  else
    redirect '/?errors=unable_to_initialize_survey'
  end

end
