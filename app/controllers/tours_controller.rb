class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  def index
    @tours = Tour.all
  end


  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.save

    redirect_to root_path
  end

  def update
    @tour.update(tour_params)
    redirect_to root_path
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :description, :location, :date, :price, :language, :start_time, :duration)
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end

end
