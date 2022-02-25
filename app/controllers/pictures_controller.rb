class PicturesController < ApplicationController
  def destroy
    picture = Picture.find(params[:id])
    Cloudinary::Api.delete_resources(["#{picture.image}"])

    if picture.destroy
      render json: picture
    else
      render json: {}
    end
  end
end
