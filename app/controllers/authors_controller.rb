class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def update
    @author = Author.find(params[:id])

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

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def set_author!
    @author = Author.find(params[:id])
  end
end
