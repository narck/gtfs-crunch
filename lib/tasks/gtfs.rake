namespace :gtfs do
  desc "Updates the "
  task update: :environment do
    GTFS_FEED_URL = ENV['GTFS_FEED_URL']
    url = URI.parse GTFS_FEED_URL
    request = Net::HTTP::Get.new(url)

    puts "Fetching #{GTFS_FEED_URL}..."
    response = Net::HTTP.start(url.host, url.port) { |http|
      http.request(request)
    }
    input_stream = StringIO.new(response.body)
    sha_digest = Digest::SHA1.hexdigest input_stream.string
    settings = GtfsSettings.instance

    if sha_digest == settings.latest_digest
      puts "Already up to date."
      next
    else
      puts "Found newer GTFS feed (#{settings.latest_digest} -> #{sha_digest}). Updating..."
      settings.latest_digest = sha_digest
      settings.save
    end

    gtfs_zip = Zip::InputStream.open(input_stream)
    while (entry = gtfs_zip.get_next_entry)
      cls_name = entry.to_s.split('.').first.split('_').collect {|w| w.singularize.capitalize}.join
      cls = Object.const_get(cls_name)
      cls.copy_from(entry.get_input_stream)
    end
    puts "GTFS database updated, latest update hash is: #{sha_digest}"
  end

end
