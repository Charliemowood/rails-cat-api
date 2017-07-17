class CatsController < ApplicationController
  def index
    cats = [
      {name: "Tibby"},
      {name: "Garry"},
      {name: "Berty"}
    ]
      # send json
      render json: cats
  end




end
