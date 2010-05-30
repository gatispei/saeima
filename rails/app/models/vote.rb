class Vote < ActiveRecord::Base

    belongs_to :poll
    belongs_to :member

end
