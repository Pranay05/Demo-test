class CommentsController < ApplicationController

def index
@comment = Comment.all
render json: {:comment=> @comment}
end


def create
	@event = Event.find(params[:event_id])
	if @event.blank?
			return render json: {response: 500,msg: "event not found"}
	end
    	@comment = @event.comments.create(comment_params)
 
		if @comment.save!
			render json: {response: 200,msg: "comment Created", comments: @comment}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
    
  end

  def update 
   @comment = Comment.find(params[:comment_id])
   if @comment.blank?
			return render json: {response: 500,msg: "comment not found"}
	end

	 if @comment.update(comment_params)
	 	render json: {response: 200,msg: "comment updated", comment: @comment}
		else
			render json: {response: 500,msg: "Event Not updated"}
		end
	end


	def destroy
		@comment = Comment.find(params[:comment_id])

		if @comment.blank?
			return render json: {response: 500,msg: "comment not found"}
	end
	if @comment.destroy
		render json: {response: 200,msg: "comment deleted" }
    else
    	render json: {response: 500,msg: "could not delete"}
    end
end


  private
    def comment_params
      params.require(:comment).permit(:name, :body, :user_id)
    end


end
