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
      booking: @booking
    )
    if @booking.save
      redirect_to tour_path(@tour)
    else
      render 'tours/show'
    end

  end
end
