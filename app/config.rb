module Config
  extend self

  def self.included(base)
    base.extend self
  end

  def device_id
    App::Persistence['device_id'] ||= BubbleWrap.create_uuid
  end

  def api_root_url
    "http://api.trailsafeapp.dev"
  end

  def api_key
    "f5e6b6e668cbc417f0100540b8f6026cbb88aea248f29f9cd11a3bde30687551ede350ce3ec554466b2c11fb4ea6d4f92f91f9ab23e2aa980683acf613d337a5"
  end

end