class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pools = policy_scope(Pool)
    @pools = Pool.all
  end

  def new
    @pool = Pool.new
    authorize @pool
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    authorize @pool
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @pool
    @pool = Pool.find(params[:id])
  end

  private

  def pool_params
    params.require(:pool).permit(:name, :description, :price, :image, :category, :location)
  end
end
