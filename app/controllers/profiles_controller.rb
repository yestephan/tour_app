class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private
  def profile_params
    received_params = params.require(:user).permit(:first_name, :last_name, :age, :email, :description, :file)

    unless received_params[:file].nil?
      uploaded_picture = Cloudinary::Uploader.upload(received_params[:file].tempfile.path)
      received_params[:picture] = uploaded_picture["public_id"]
    end

    received_params.delete(:file)

    return received_params
  end
end
