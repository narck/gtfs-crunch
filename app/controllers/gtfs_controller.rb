require 'csv'

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
    gtfs_zip = Zip::InputStream.open(input_stream)

    while entry = gtfs_zip.get_next_entry
      if entry.to_s == 'shapes.txt'
        fields = nil

        CSV::parse(entry.get_input_stream.read) do |row|
          if fields.nil?
            fields = row
          else
            params = {}
            fields.each_with_index do |field, i|
              params[field] = row[i]
            end
            kwargs = params.symbolize_keys
            Shape.create(**kwargs)
          end
        end
      end
    end

    render :json => [sha_digest, res.msg]
  end
end