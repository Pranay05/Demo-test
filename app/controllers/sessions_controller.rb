class SessionsController < ApplicationController

 def new

  end
def create
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])

		session[:user_id] = user.id
		render json: {user_id: user.id,response: 200,msg: "sucessfully updated"}
	else
		render json: {response: 500, msg: "bad request"}
	end
end 

def destroy
	session[:user_id] = nil
	render json: {rseponse: 200, msg: "bad request"}
	
 
end


end
