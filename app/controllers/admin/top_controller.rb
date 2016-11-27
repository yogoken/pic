class Admin::TopController < ApplicationController
  def index
    @admin = current_user.admin
  end
end
