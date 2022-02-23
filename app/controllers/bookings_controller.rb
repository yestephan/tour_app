class BookingsController < ApplicationController
  def index
  end

  def show

  end

  def new
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @user = current_user
    @booking = Booking.new(
      tour: @tour,
      user: @user
    )
    if @booking.save
      flash[:notice] = "Booking accepted for #{@tour.title}"
      redirect_to tour_path(@tour)
    else
      render 'tours/show'
    end

  end
end
