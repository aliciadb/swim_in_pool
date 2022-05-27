class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @pool = Pool.find(params[:pool_id])
    @booking.pool = @pool
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboards_path, notice: "You have succesfully booked this pool. Happy swimming :)"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboards_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
