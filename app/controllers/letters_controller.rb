class LettersController < ApplicationController
  def index
    @letters = Letter.order('created_at desc')
  end

  def new
  end

  def create
    letter = Letter.new(url_params)
    if letter.save
      letter.create_letter
      flash[:notice] = '投稿に成功しました'
      redirect_to letter_path(letter)
    else
      flash[:alert] = '投稿に失敗しました'
      redirect_to :back
    end
  end

  def show
    @letter = Letter.find(params[:id])
  end

  private

  def url_params
    params.permit(:url)
  end
end
