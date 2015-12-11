class Choice < ActiveRecord::Base
  belongs_to    :questions

  has_many      :selections


end
