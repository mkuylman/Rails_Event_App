class CommentsController < ApplicationController
  def create
  	comment = Comment.new(comment: params[:comment], user_id: params[:user_id], event_id: params[:event_id])
  	if comment.save
  		redirect_to "/events/#{params[:event_id]}"
  	else
  		render html: 'failed'
  	end
  end
end
