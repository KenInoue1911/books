class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
    flash[:notice] = "　　Book was successfully Created!" 
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      @books = Book.find(params[:id])
      render :edit
    end
    flash[:notice] = "　　Book was successfully Updated!" 
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice1] = "　　Book was successfully Deleted!" 
  end

  private
  def book_params
    params.require(:book).permit(:title, :category, :body)
  end
end
