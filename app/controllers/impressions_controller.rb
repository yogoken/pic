class ImpressionsController < ApplicationController
  before_action :authenticate_user!

  def create
    impression = Impression.new(create_params)
    if impression.save
      flash[:notice] = '感想を投稿しました'
    else
      flash[:alert] = '感想を作成できませんでした'
    end
    redirect_to :back
  end

  def destroy
    impression = Impression.find(params[:id])
    if impression.destroy
      flash[:notice] = '感想を削除しました'
    else
      flash[:alert] = '感想を削除できませんでした'
    end
    redirect_to :back
  end

  private

  def create_params
    book_id = params.require(:book_id)
    params.require(:impression).permit(:content).merge(user_id: current_user.id, book_id: book_id.to_i)
  end
end
