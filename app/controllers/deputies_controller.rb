class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.includes(:party).search(params[:search]).page params[:page]
  end
end