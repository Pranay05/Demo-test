class UsersController < ApplicationController
def index
	@user = User.all
	render json: {:user=> @user}

end


def home

@user= User.find_by(id: params[:home][:user_id])
@events = @user.events.all


render json: {response: 200, user: @user, event: @events}



end


def new
	
end

def create

	@user = User.new(user_params)
	
	if @user.save!
		#session[:user_id] = @user.id
		render json: {:user => @user, status: 200 }
	else
		render json:{ staus: 400 }
	end
		

end

def update
 	user = User.find(params[:id])
	return render json: {response: 500,msg: "user not found"} if user.blank?

	 if user.update(user_params)
 		render json: {response: 200,msg: "sucessfully updated",user: user } 
	else
		render json: {response: 500,msg: "coudn't update"}
	end

end	

def destroy
user = User.find(params[:id])

return render json: {response: 500,msg: "user not found"} if user.blank?

	if user.destroy
    	render json: {response: 200, msg: "sucessfully destroyed"}
	end

end

	



 




private

def user_params
params.require(:user).permit(:first_name,:email,:last_nam,:adhar_no,:dob,:phone,:gender,:state,:country,:password,:password_confirmation)

end

def home_params
params.require(:home).permit(:user_id)
end


end
