class LettersController < ApplicationController
  def index
    @letters = Letter.order('created_at desc')
  end
end
