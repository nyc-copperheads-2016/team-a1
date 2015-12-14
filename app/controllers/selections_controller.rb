post '/selections' do
  selection = Selection.new(params[:selection])
  if selection.save && selection.survey_has_more_questions?
    question_id = Selection.next_question(selection)
    redirect "/surveys/#{selection.response.survey_id}/questions/#{question_id}"
  elsif selection.all_questions_asked?
    redirect "/surveys/#{selection.response.survey.id}/end"
  else
    redirect"/?errors=something_went_wrong"
  end
end
