class DaysController < ApplicationController

    def index
        @days = Day.all
    end

    def show
        puts "lala"
        @day = Day.find(params[:id])

        @polls = Poll.find(:all, :order => "date", :conditions => [ "date(date) = \"#{@day.date}\"" ] )
#        @polls = Poll.find(:all, :order => "date", :select => "date(date) = #{@day.date}")
        puts @polls.size
        puts "************"

    end

end
