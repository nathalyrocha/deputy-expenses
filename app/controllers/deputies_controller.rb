class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.includes(:party).page params[:page]
  end
end