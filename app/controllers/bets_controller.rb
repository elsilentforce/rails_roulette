class BetsController < ApplicationController
  def index
    @rounds = Round.all
    @users = User.all
  end
end
