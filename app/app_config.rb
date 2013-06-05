module AppConfig
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

  def pixate_key
    "J144G-PVVDP-LRTHO-P7JQQ-TTJJC-34J9F-RPF3C-IS0GG-L0JE0-HDBFQ-4DBNN-M5KOI-E5S40-RFOIR-VG51L-2O"
  end

  def pixate_user
    "jason@waldrip.net"
  end

end