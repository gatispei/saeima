class PollsController < ApplicationController

    def index
        @polls = Poll.find(:all, :order => "date").paginate :page => params[:page], :per_page => 25

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @poll = Poll.find(params[:id])
        @votes = @poll.votes
        @members = @votes.map { |v| v.member }

        @partys = @members.map { |m| m.party }.uniq
        @grouped_votes = @partys.map { |p|
            @members.zip(@votes).select { |x| x[0].party == p }.sort { |a,b|
                if a[1].vote == b[1].vote
                    a[0].surname <=> b[0].surname
                else
                    a[1].vote <=> b[1].vote
                end
            }
        }
        @max = @grouped_votes.map { |g| g.size }.sort.last

        @votes.sort! { |a, b|
            if a.member.party == b.member.party
                a.member.surname <=> b.member.surname
            else
                a.member.party <=> b.member.party
            end
        }

        respond_to do |format|
            format.html # show.html.erb
        end
    end

end
