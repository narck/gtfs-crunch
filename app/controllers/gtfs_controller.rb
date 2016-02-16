class GtfsController < ApplicationController

  GTFS_FEED_URL = ''

  def update
    url = URI.parse GTFS_FEED_URL
    req = Net::HTTP::Get.new(url)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }
    input_stream = StringIO.new(res.body)
    sha_digest = Digest::SHA1.hexdigest input_stream.string

    render :json => [sha_digest, res.msg]
  end
end