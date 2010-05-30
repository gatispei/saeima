class Poll < ActiveRecord::Base

    has_many :votes
    has_many :members, :through => :votes

end
