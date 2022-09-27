class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new(book_params)
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end
    flash[:notice] = "successfully"
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "successfully"
  end
  
  def destory
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
    flash[:notice] = "successfully"  
    end
   
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
   
   
  
end
