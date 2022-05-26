class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pools = policy_scope(Pool)
    sql_query = "location ILIKE :query OR category ILIKE :query"
    if Pool.where(sql_query, query: "%#{params[:query]}%").empty?
      redirect_to root_path, notice: "There are no pools matching your search, please start again!"
    elsif params[:query].present?
      @pools = Pool.where(sql_query, query: "%#{params[:query]}%")
    else
      @pools = Pool.all
    end

    @markers = @pools.geocoded.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude
      }
    end
  end

  def show
    @pool = Pool.find(params[:id])
    authorize @pool
    @booking = Booking.new
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
    @pool = Pool.find(params[:id])
    authorize @pool
  end

  def update
    @pool = Pool.find(params[:id])
    authorize @pool
    @pool.update(pool_params)
    redirect_to pool_path(@pool)
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.delete
    authorize @pool
    redirect_to root_path, status: :see_other
  end

  private

  def pool_params
    params.require(:pool).permit(:name, :description, :price, :category, :location, :photo)
  end
end
