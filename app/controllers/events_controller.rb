class EventsController < ApplicationController
	def index 
		@user = User.find(session[:id])
		@invalid = flash[:invalid]
		@user_state = @user.state
		puts @user_state

		@user_in_state = Event.where(state: @user_state)

		@user_out_state = Event.where.not(state: @user_state)

		@states = ["","AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]
		@events = Event.all
		@events.each do |event|
				event.users.each do |user|
			end
		end
	end

	def create
    event = Event.new(event_params)
    if event.save
      redirect_to '/events'
    else
      flash[:invalid] = event.errors.full_messages
      redirect_to '/events'
    end
	end

	def edit
		@event = Event.find(params[:id])
		@states = ["","AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]
	end

	def update
		event = Event.find(params[:id])

		 if event.update(event_params)
      redirect_to '/events'
    end
	end

	def show
		@id = session[:id]
	  if Event.find(params[:id])
      @event = Event.find(params[:id])
    end
	end

	def destroy
		event = Event.find(params[:id]).destroy
		redirect_to '/events'
	end
	 
	 private 
    def event_params
      params.require(:event).permit(:name, :location_city, :state, :user_id, :date)
   	end 
end
