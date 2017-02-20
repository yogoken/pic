class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @books = Book.where(user_id: @user)
  end

  def show
    @book = Book.find(params[:id])
    @impression = Impression.new
    @impressions = @book.impressions
  end

  def new
    @search_books = Book.search_book(params[:keyword])
  end

  def create
    book = Book.new(create_params)
    if book.save
      flash[:notice] = "おすすめ本の投稿に成功しました"
      redirect_to user_book_path(current_user, book)
    else
      flash[:alert] = "おすすめ本の投稿に失敗しました"
      redirect_to :back
    end
  end

  private

    def create_params
      params.require(:book).permit(
        :title,
        :image,
        :url,
        :author,
        :manufacturer
).
        merge(user_id: current_user.id)
    end
end
