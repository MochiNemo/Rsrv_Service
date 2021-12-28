class RsrvsController < ApplicationController
  def show
    @rsrvs = Rsrv.includes(:room).all
  end
end
