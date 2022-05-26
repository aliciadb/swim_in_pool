class DashboardsController < ApplicationController
  def show
    @pools = current_user.pools
    authorize @pools
    @bookings = current_user.bookings
  end
end
