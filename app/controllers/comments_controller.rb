class CommentsController < ApplicationController

def index
@comment = Comment.all
render json: {:comment=> @comment}
end


def create
	@user = User.find(params[:user_id])
	if @user.blank?
			return render json: {response: 500,msg: "user not found"}
	end
    @event = @user.events.find(params[:event_id])
    

    if @event.blank?
			return render json: {response: 500,msg: "event not found"}
	end

		@comment = @event.comments.create(comment_params)
		byebug

		if @comment.save!
			render json: {response: 200,msg: "comment Created", comments: event_comment}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
    
  end
 
  private
    def comment_params
      params.require(:comment).permit(:name, :body)
    end


end
