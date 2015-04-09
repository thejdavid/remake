class UsersController < ApplicationController
  def index
    @artist = User.where("artist = true")
  end
  def show
  end
end