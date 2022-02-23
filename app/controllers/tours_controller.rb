class ToursController < ApplicationController
before_action :authenticate_user!

  def index
    @tours = Tour.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @tours.geocoded.map do |tour| {
        lat: tour.latitude,
        lng: tour.longitude,
        info_window: render_to_string(partial: "info_window", locals: {
          tour: tour }),
        image_url: helpers.asset_url("https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1642&q=80")
      }
    end
  end

  def new
    @tour = Tour.new
  end

  def create
    @user = current_user

    @tour = Tour.new(tour_params)
    @tour.user = @user
    @tour.save

    if @tour.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @tour = Tour.find(params[:id])
    render :new
  end

  def update
    @user = current_user
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to profile_path
  end

  private

  def tour_params
    received_params = params.require(:tour).permit(:title, :description, :address, :date, :price, :language, :start_time, :duration, :file)

    unless received_params[:file].nil?
      uploaded_picture = Cloudinary::Uploader.upload(received_params[:file].tempfile.path)
      received_params[:picture] = uploaded_picture["public_id"]
    end

    received_params.delete(:file)

    return received_params
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end

end
