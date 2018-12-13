Excon.defaults[:ssl_verify_peer] = false

PROTOCOL = ENV['PROTOCOL'].presence || "http"
HOST_NAME = ENV["HOST_NAME"].presence || "localhost:3000"
SEARCH_DOMAIN = ENV["SEARCH_DOMAIN"].presence || "localhost:9000"

HOST_URL = "#{PROTOCOL}://#{HOST_NAME}"
PROXY_URL = ENV["PROXY_URL"] || nil
INFO_LOBSTER_EMAIL = "support@lobster.media"
SUPPORT_LOBSTER_EMAIL = "support@lobster.media"

# External API options.
API_REQUEST_TIMEOUT = 5000 #ms

# Geolocation DB query options.
# GeoPlugin URI: http://www.geoplugin.net/json.gp
# IpInfoDB URI: http://api.ipinfodb.com/v3/ip-city/
GEOPLUGIN_GEO_IP_SERVICE_URI = "http://www.geoplugin.net/json.gp"
IPINFODB_GEO_IP_SERVICE_URI = "http://api.ipinfodb.com/v3/ip-city/"
GEO_IP_SERVICE_URI = GEOPLUGIN_GEO_IP_SERVICE_URI
IPINFODB_API_KEY = "ac24791b5bc98fa9a9d714ecfe27793c414c8109eb318c35cbfdea9ae3d53d2b"
DEFAULT_NEAREST_RADIUS = 500 #km
DEFAULT_MAX_RADIUS = 1000 #km
EARTH_RADIUS = 6371 #km
MAX_LOCATION_RESULTS = 1000
DEFAULT_USER_LOCATION = [-0.1015987, 51.5286416] # (lon, lat) Moscow

# Orders options.
ORDER_SELLER_AMOUNT = 0.75 #USD
ORDER_LOBSTER_AMOUNT = 0.24 #USD
ORDER_FULL_AMOUNT = ORDER_SELLER_AMOUNT + ORDER_LOBSTER_AMOUNT # USD
ORDER_LOBSTER_FEE_RATE = 0.24

# Number of tags in the tag cloud.
CLOUD_TAGS_NUMBER = 7

# Number of promo banners on seller.
LOBSTER_PROMO_BANNER_COUNT = 2

# File with list of fake top searched today tags.
WANTED_TAGS_LIST_PATH = "#{Rails.root}/lib/wantedtags.txt"

# Search settings.
CONTENT_ROW_RESULTS_PER_PAGE = 5
