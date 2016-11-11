class LettersController < ApplicationController
  before_action :authenticate_user!, only: %i(new create show)

  def index
    @letters = Letter.order('created_at desc')
    @status = 'newest'
  end

  def new
  end

  def create
    @letters = Letter.order('created_at desc')
    unless @letters.pluck(:url).include?(url_params[:url])
      letter = Letter.new(url_params)
      if letter.save
        letter.create_letter
        flash[:notice] = '投稿に成功しました'
        redirect_to letter_path(letter)
      else
        flash[:alert] = '投稿に失敗しました'
        redirect_to :back
      end
    else
      @select_letter = Letter.find_by(url: url_params[:url])
      redirect_to letter_path(@select_letter)
    end
  end

  def show
    @letter = Letter.find(params[:id])
    @comment = Comment.new
    @comments = @letter.comments
  end

  private

  def url_params
    params.permit(:url)
  end
end
