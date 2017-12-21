class PostsController < ApplicationController
  def show
  end

  def new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    @check_post.new(post_params)
  if @check_post.valid?
    @post.update
    redirect_to post_path(@post)
  else
    render :edit
  end

  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
