post '/selections' do
  selection = Selection.new(params[:selection])
  if selection.save && selection.response.selections.count < selection.response.survey.questions.count
    question_id = Selection.next_question(selection)
    redirect "/surveys/#{selection.response.survey_id}/questions/#{question_id}"
  else
    redirect "/surveys/#{selection.response.survey.id}/end"
  end
end
