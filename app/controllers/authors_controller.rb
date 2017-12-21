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

    @author.name = author_params[:name]
    @author.email = author_params[:email]
    @author.phone_number = author_params[:phone_number]

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
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
