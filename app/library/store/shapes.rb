class ShapesStore
  class << self
    def get_points_for_named_route(route_name)
      Shape.joins("
      JOIN trips ON trips.shape_id=shapes.shape_id
      JOIN routes ON trips.route_id=routes.route_id")
          .where(routes: {route_short_name: route_name}, trips: {direction_id: 1}).uniq.order(:shape_pt_sequence) # TODO: dynamic direction
    end
  end

end

