class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def edit
    authorize @pool
    @pool = Pool.find(params[:id])
  end
end
