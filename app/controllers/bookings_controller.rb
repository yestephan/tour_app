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
      flash[:notice] = "You've requested to join #{@tour.title}. Your tour guide will get back to you in 24 hours."
      redirect_to tour_path(@tour)
    else
      render 'tours/show'
    end

  end
end
