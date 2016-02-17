class ShapeController < ApplicationController

  def get
    shape = Shape.where(shape_id: params[:id])
    render :json => shape
  end

  def parsed
    shape = Shape.where(shape_id: params[:id])

    coordinates = []

    shape.each do |row|
      c = row.shape_pt_lat, row.shape_pt_lon
      coordinates.push(c)
    end

    data = {:positions => coordinates}
    render :json => data
  end

end