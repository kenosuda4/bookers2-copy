class BooksController < ApplicationController

  before_action :authenticate_user!



  def new
    @book = Book.new(book_params)
  end
  
  def index
    @books = Book.all    
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
        @books = Book.all
        @user = current_user
        flash[:notice] = "error"
        render :'index'
    end
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if  book.update(book_params)
        flash[:notice] = "Book was successfully created."
        redirect_to books_path
    else
      @book = Book.find(params[:id])
        flash[:notice] = "error"
        render :'edit'
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body,)
  end

 

end
