class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @book = Book.find(params[:book_id])
    @review.book = @book

    if @review.save
      flash[:notice] = 'Review submitted'
      redirect_to book_path(params[:book_id])
    else
      flash[:notice] = 'Missing content'
      redirect_to new_book_review_path(params[:book_id])
    end
  end

  protected
    def review_params
      params.require(:review).permit(:body, :rating, :book_id)
    end
end
