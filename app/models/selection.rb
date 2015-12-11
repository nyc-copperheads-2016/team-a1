class Selection < ActiveRecord::Base
  belongs_to    :responses
  belongs_to    :choices
end
