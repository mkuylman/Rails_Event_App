class UsersController < ApplicationController
  def index
  end

  def new
    @success = flash[:success]
    @states = ["","AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = "User sucessfully registered! Please Login"
      redirect_to '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    @states = ["","AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      session[:name] = user.full_name
      redirect_to '/events'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :location_city, :state, :password, )
    end
end
