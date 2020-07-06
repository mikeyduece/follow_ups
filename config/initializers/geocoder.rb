Geocoder.configure(
  # Geocoding options
  timeout: 3,                 # geocoding service timeout (secs)
  lookup: :google,         # name of geocoding service (symbol)
  api_key: Rails.application.credentials[:google_api_key],               # API key for geocoding service
  # cache: nil,                 # cache object (must respond to #[], #[]=, and #del)
  # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys

)
