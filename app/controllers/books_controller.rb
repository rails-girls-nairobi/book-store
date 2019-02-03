class BooksController < ApplicationController
  def index
    @books = Book.paginate(:page => params[:page], per_page: 4)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :description
    )
  end
end