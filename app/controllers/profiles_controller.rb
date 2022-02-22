class ProfilesController < ApplicationController
  def show
    # @user = ...
  end

  def edit
    @user = User.take
  end

  def update

  end
end
