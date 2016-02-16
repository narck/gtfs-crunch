class ShapeController < ApplicationController

  def get
    shape = Shape.where(shape_id: params[:id])
    render :json => shape
  end

end