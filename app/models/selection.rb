class Selection < ActiveRecord::Base
  belongs_to    :response
  belongs_to    :choice

  def self.next_question(current_selection)
    current_selection.choice.question.id + 1
  end
end
