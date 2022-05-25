class DashboardsController < ApplicationController
  def show
    @pools = current_user.pools
    authorize @pools
  end
end
