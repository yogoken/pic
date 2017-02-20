class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_letter
  before_action :set_comment
  before_action :set_id_num

  def create
    Like.create(create_params)
  end

  def destroy
    Like.find(params[:id]).destroy
  end

  private

    def create_params
      params.permit(:comment_id).merge(user_id: current_user.id)
    end

    def set_letter
      @letter = Letter.find(params[:letter_id])
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def set_id_num
      @id_num = params[:comment_id]
    end
end

