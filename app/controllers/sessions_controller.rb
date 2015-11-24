class SessionsController < ApplicationController
  def create
  	# render html: 'here'
  	user = User.find_by(user_params)
  	if user
  		session[:id] = user.id
  		session[:name] = user.full_name
  		redirect_to '/events'
  	else
      flash[:errors] = ["Invalid email/password combination"]
  		redirect_to '/'
  	end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

   private 
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
