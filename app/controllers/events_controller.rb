class EventsController < ApplicationController

	def index
  	@events = Event.paginate(page: params[:page], per_page: 10)

    if @events.empty?
      flash[:error] = "There is no logged event."
    end
  end

end
