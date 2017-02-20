class StoragesController < ApplicationController
  before_action :authenticate_user!

  def create
    storage = Storage.new(create_params)
    if storage.save
      flash[:notice] = ''
      redirect_to :back
    else
      flash[:alert] = 'ニュース保管リストに登録できませんでした。'
      redirect_to :back
    end
  end

  def destroy
    if Storage.find(params[:id]).destroy
      flash[:notice] = 'ニュース保管リストから取り除きました。'
      redirect_to :back
    else
      flash[:alert] = 'ニュース保管リストから取り除けませんでした。'
      redirect_to :back
    end
  end

  private

    def create_params
      params.require(:storage).permit(:letter_id).merge(user_id: current_user.id)
    end
end
