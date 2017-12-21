class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
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
    @post.title = post_params[:title]
    @post.content = post_params[:content]
    @post.category = post_params[:category]

    if @post.valid?
      @post.save
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
