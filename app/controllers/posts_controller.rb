class PostsController < ApplicationController
  def new
    @subs = Sub.all
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      @subs = Sub.all
      render :new
    end
  end

  def update
    @post = current_user.subs.post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def require_author
    unless self.author_id == current_user.id
      flash[:errors] = ['Only post author can edit post']
      render :show
    end
  end
end
