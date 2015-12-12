class Response < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :survey

  has_many      :selections

  validates :user_id, uniqueness: { scope: :survey_id,
    message: "You can only take a survey once!" }
end
