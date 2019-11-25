class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :create]
  before_action :correct_user, only: [:edit, :update]
  def top
  end

  def about
  end

  def index
    @books = Book.all
    @book= Book.new
  end

  def show
    @book = Book.new
    @bookd = Book.find(params[:id])

  end

  def edit
    @bookd = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'successfully'
      redirect_to book_path(@book.id) 
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = 'successfully'
    else
      @bookd=Book.find(params[:id])
      render :edit
    end
  end

  def destroy
    @book_image = Book.find(params[:id])
    @book_image.destroy
    redirect_to books_path
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end

    def correct_user
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

end
