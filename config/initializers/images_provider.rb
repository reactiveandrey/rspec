ImagesProvider::Config.endpoints = [
  ImagesProvider::Endpoint.new(
    address: 'https://hedgehog.lobster.media',
    interval_start: '000',
    interval_end: '7ff'
  ),
  ImagesProvider::Endpoint.new(
    address: 'https://hammer.lobster.media',
    interval_start: '800',
    interval_end: 'fff'
  )
]
