class Selection < ActiveRecord::Base
  belongs_to    :response
  belongs_to    :choice

  def self.next_question(current_selection)
    current_selection.choice.question.id + 1
  end

  def survey_has_more_questions?
    self.response.selections.count < self.response.survey.questions.count
  end

end
