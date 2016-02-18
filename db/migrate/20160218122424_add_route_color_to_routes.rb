class AddRouteColorToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :route_color, :string
  end
end
