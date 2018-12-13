Celluloid.logger = Rails.logger

Celluloid::Actor[:instagram_search]      = Search::Instagram.pool(size: Celluloid.cores * 2)
Celluloid::Actor[:flickr_search]         = Search::Flickr.pool(size: Celluloid.cores * 2)
# Celluloid::Actor[:internal_search]       = Search::Internal.pool(size: Celluloid.cores * 4)
Celluloid::Actor[:youtube_search]        = Search::Youtube.pool(size: Celluloid.cores * 2)
Celluloid::Actor[:vkontakte_search]      = Search::Vkontakte.pool(size: Celluloid.cores * 2)
Celluloid::Actor[:vimeo_search]          = Search::Vimeo.pool(size: Celluloid.cores * 2)
