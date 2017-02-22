class LettersController < ApplicationController
  before_action :authenticate_user!, only: %i(new create show)

  def index
    @letters = Letter.order("created_at desc").page(params[:page])
    @status = "newest"
  end

  def new; end

  def create
    @letters = Letter.order("created_at desc")
    if @letters.pluck(:url).include?(url_params[:url])
      @select_letter = Letter.find_by(url: url_params[:url])
      redirect_to letter_path(@select_letter)
    else
      letter = Letter.new(url_params)
      if letter.save
        letter.create_letter
        flash.now[:notice] = "投稿に成功しました"
        redirect_to letter_path(letter)
      else
        flash.now[:alert] = "投稿に失敗しました"
        redirect_to root_path
      end
    end
  end

  def show
    @letter = Letter.find(params[:id])
    @comment =  Comment.new
    @comments = @letter.comments
    @create_storage = Storage.new
    @delete_storage = Storage.find_by(user_id: current_user.id, letter_id: @letter.id)
  end

  def destroy
    if Letter.find(params[:id]).destroy
      flash.now[:notice] = "記事を削除しました"
    else
      flash.now[:alert] = "記事を削除できませんでした"
    end
    redirect_to root_path
 end

  private

    def url_params
      params.permit(:url)
    end
end
