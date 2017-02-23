class CommentsController < ApplicationController

	def create
		@gram = Gram.find_by_id(params[:gram_id])
		if current_user
			if @gram.present? 
				@gram.comments.create(comment_params.merge(user: current_user))
				redirect_to root_path
			else
				return render :new, status: :not_found
			end
		else
			redirect_to new_user_session_path
		end

	end

private
	def comment_params
		params.require(:comment).permit(:message)
	end
end
