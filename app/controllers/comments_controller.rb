class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_letter, only: %i(create)

  def create
    if Comment.create(create_params)
      flash.now[:notice] = "Pickできました。"
    else
      flash.now[:alert] = "Pickできませんでした。"
    end
    redirect_to letter_path(@letter)
  end

  def destroy
    if Comment.find(params[:id]).destroy
      flash.now[:notice] = "Pickを削除しました。"
    else
      flash.now[:alert] = "Pickを削除できませんでした。"
    end
  end

  private

  def create_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, letter_id: params[:letter_id])
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end
end
