class DashboardsController < ApplicationController
  def index
    @pools = policy_scope(Pool)
    @pools = Pool.all
  end
end
