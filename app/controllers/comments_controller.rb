class CommentsController < ApplicationController

 def create
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new(comment_params)
  if @comment.save
    redirect_to prototype_path(params[:prototype_id])
  else
    render "prototypes/show"
  end
 end

 private

 def comment_params
   params.require(:comment).permit(:content).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
 end

end
