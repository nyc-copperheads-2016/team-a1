class Choice < ActiveRecord::Base
  belongs_to    :question

  has_many      :selections
  validates :text, length: { minimum: 1 }

end
