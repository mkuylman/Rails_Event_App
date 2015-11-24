class EventusersController < ApplicationController
	def create
		eventuser = Eventuser.create(user: User.find(params[:user_id]), event: Event.find(params[:event_id]))
	
		if eventuser.save
			redirect_to '/events'
		else
			render html: 'failed'
		end
	end

	def destroy
		eventuser = Eventuser.find(params[:id]).destroy
		
		redirect_to '/events'
	end
end
