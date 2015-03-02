class WodCategory < ActiveRecord::Base
  belongs_to :wod
  belongs_to :category  
end
