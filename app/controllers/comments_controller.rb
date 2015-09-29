class CommentsController < ApplicationController

  def create
    #create a new comment associated with a post
    #and associated with the current user who created it

    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post
    @comment.user = current_user


    if @comment.save
      flash[:notice] = "Comment created"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Woopsie Daisy. Something went wrong."
      redirect_to [@topic, @post]
    end
  end
end
