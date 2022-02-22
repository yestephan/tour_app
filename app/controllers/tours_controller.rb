class ToursController < ApplicationController
  # before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @tours = Tour.all
  end

  def show
    # list the bookings?
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = @user
    @tour.save

    if @tour.save!
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
    render :new
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to profile_path
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :description, :location, :date, :price, :language, :start_time, :duration)
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
