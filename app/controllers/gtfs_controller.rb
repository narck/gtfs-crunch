class GtfsController < ApplicationController

  def status
    settings = GtfsSettings.instance

    render :json => {:latest_digest => settings.latest_digest, :update_at => settings.updated_at}
  end

end
