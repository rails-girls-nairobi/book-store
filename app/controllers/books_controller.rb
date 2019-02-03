class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 4)
  end

  def show
    @book = Book.find(book_id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Created new book successfully' }
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
    @book = Book.find(book_id)
  end

  def update
    @book = Book.find(book_id)
    @book.update(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Successfully updated book' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @book = Book.find(book_id)
    @book.destroy
    flash[:notice] = 'Book has been deleted'
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :description
    )
  end

  def book_id
    params[:id]
  end
end
