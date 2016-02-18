require 'csv'

class GtfsController < ApplicationController

  GTFS_FEED_URL = ''

  def update
    url = URI.parse GTFS_FEED_URL
    request = Net::HTTP::Get.new(url)
    response = Net::HTTP.start(url.host, url.port) { |http|
      http.request(request)
    }
    input_stream = StringIO.new(response.body)
    sha_digest = Digest::SHA1.hexdigest input_stream.string
    settings = GtfsSettings.instance

    if sha_digest == settings.latest_digest
      return render :json => {:latest_digest => settings.latest_digest, :update_at => settings.updated_at}
    else
      settings.latest_digest = sha_digest
      settings.save
    end

    gtfs_zip = Zip::InputStream.open(input_stream)


    while (entry = gtfs_zip.get_next_entry)
      if entry.to_s == 'shapes.txt'
        create_gtfs_objects(entry.get_input_stream.read)
      end
    end

    render :json => [sha_digest, response.msg]
  end

  private
  def create_gtfs_objects(csv_string)
    fields = nil

    ActiveRecord::Base.transaction do
      CSV::parse(csv_string) do |row|
        if fields.nil?
          fields = row
        else
          params = {}

            fields.each_with_index do |field, i|
              params[field] = row[i]
            end

            Shape.create(**params.symbolize_keys)
        end
      end
    end
  end
end
