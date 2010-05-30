class MembersController < ApplicationController
  def index
#    @members = Member.all
      @sort_order = params[:sort]
      @sort_order = "party,surname" if !@sort_order
      @sort_order = @sort_order.split(",")

      @members = Member.find(:all, :order => @sort_order.join(",") )
      @days_count = Day.count

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
      @member = Member.find(params[:id])
      @days_count = Day.count

      @polls = @member.polls.find(:all, :order => "date").paginate :page => params[:page], :per_page => 25
      @votes = @polls.map { |p| @member.votes.find(:first, :conditions => [ "poll_id = #{p.id}" ] ) }

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
