class ProfilesController < ApplicationController
  def show
    # user = current_user

    @user = User.take
    @tours = @user.tours
  end

  def edit
    @user = User.take
  end

  def update

  end
end
