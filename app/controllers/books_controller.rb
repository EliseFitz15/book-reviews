class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
   if @book.save
     flash[:notice] = "Book asked"
     redirect_to '/'
   else
     flash[:error] = @book.errors.full_messages.join(". ")
     render :new
   end
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = Review.where(book_id: params[:id])
  end

  protected
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :genre)
  end
end
