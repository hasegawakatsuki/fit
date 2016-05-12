class Hospital < ActiveRecord::Base
  has_many :checkups
end
