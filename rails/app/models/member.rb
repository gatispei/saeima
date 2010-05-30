class Member < ActiveRecord::Base

    has_many :votes
    has_many :polls, :through => :votes
end
