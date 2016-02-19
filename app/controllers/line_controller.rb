require_relative '../../app/library/store/shapes'

class LineController < ApplicationController
  def shape
    route_short_name = params[:route_short_name]
    points = ShapesStore.get_points_for_named_route(route_short_name)
    coordinates = []
    points.each do |row|
      c = row['shape_pt_lat'], row['shape_pt_lon']
      coordinates.push(c)
    end

    data = {:positions => coordinates}
    render :json => data
  end
end