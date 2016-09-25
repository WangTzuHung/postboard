class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:content))
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
  def vote
    @post = Comment.find(params[:id])
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:success] = 'Your vote was counted!'
    else
      flash[:error] = "You can only vote for #{@post.title} once!"
    end

    redirect_to :back
  end
end