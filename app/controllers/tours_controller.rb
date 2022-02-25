class ToursController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @tours = Tour.geocoded
      @tours = Tour.where(sql_query, query: "%#{params[:query]}%")
      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @tours.map do |tour| {
        lat: tour.latitude,
        lng: tour.longitude,
        info_window: render_to_string(partial: "info_window", locals: { tour: tour }),
        image_url: helpers.asset_url("https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1642&q=80")
      }
      end
    else
      @tours = Tour.all
    end
  end
  def show
    @tour = Tour.find_by(id: params[:id])
  end

  def new
    @tour = Tour.new
  end

  def create
    @user = current_user

    @tour = Tour.new(tour_params)
    @tour.user = @user
    @tour.save

    process_images(@tour)

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
    process_images(@tour)
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

  def show
    set_tour
    set_gallery
  end

  private

  def process_images(tour)
    received_images = params.require(:tour)[:files]
    if received_images.nil?
      return
    end
    received_images.each do |received_image|
      uploaded_picture = Cloudinary::Uploader.upload(received_image.tempfile.path)
      picture = Picture.new({image: uploaded_picture["public_id"], tour: tour})
      picture.save
    end
  end

  def tour_params
    params.require(:tour).permit(:title, :description, :address, :date, :price, :language, :start_time, :duration)
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def set_gallery
    @pictures = []
    @tour.pictures.each_with_index do |picture, index|
      if index == 0 || index == 3
        @pictures.append([picture])
      elsif index == 1
        @pictures.append([picture])
      elsif index == 2
        @pictures[1].append(picture)
      else
        break
      end
    end
  end

end
