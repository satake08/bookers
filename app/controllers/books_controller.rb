class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
   # @book = Book.new(book_params)
   # if @book.save
   # redirect_to book_path(book.id)
    #else
   #   render :new
    #end
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    #@book = Book.new(book_params)
    #book.save
    if book.save
      redirect_to book_path(book.id)
    else
      render :index
      #redirect_to :index
      #@books = book.page(params[:page]).per(4).order(created_at: :desc)
      #render :index
    end
    # 4. トップ画面へリダイレクト
    flash[:notice] = "Book was successfully destroyed."

    #redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private

  def book_params
    params.permit(:title, :body)
    #params.require(:book).permit(:title, :body)
  end

end
