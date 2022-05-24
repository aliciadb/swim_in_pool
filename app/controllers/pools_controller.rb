class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(params[:pool])
    @pool.save
    redirect_to pool_path(@pool)
  end

  private

  def pool_params
    params.require(:pool).permit(:name, :description, :price, :image, :category)
  end
end
