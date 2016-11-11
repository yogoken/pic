class Letters::PopularController < ApplicationController
  def index
    @letters = Letter.order("comments_count  DESC")
    @status = 'popular'
    render 'letters/index'
  end
end
