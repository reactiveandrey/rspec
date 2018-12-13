# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://lobster.media'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  # Top level pages
  add about_path
  add marketplace_path
  add explore_path

  # All authors
  User.no_timeout.where(:name.exists => true).each do |user|
    add person_path(author: user.to_param)
  end

  tags = {}
  CONTENT_BATCH_SIZE = 1000

  # All images
  images_filter = SitemapContentFilter.new(MediaType::IMAGE)
  counter = 0
  loop do
    offset = CONTENT_BATCH_SIZE * counter
    images = images_filter.search(size: CONTENT_BATCH_SIZE, offset: offset)
    break if images.empty?

    images.each do |content|
      begin
        content.tags.each { |tag| tags[tag] = 1 }
        add display_content_path(content.to_param), images: [{
          loc: ImagesProvider::Client.build_url(content: content, type: :large),
          caption: content.description.presence || content.tags.try(:join, ', ') || content.neural_description,
          geo_location: [content.city, content.country].compact.join(', '),
          title: content.name,
          license: 'http://lobster.media/terms#license'
        }]
      rescue => e
        puts "#{e.class.name}: #{e.inspect}"
        puts "Error for content: #{content.id}"
      end
    end

    counter += 1
  end

  # All videos - commented for now cause we can't show original videos
  # Content.no_timeout.for_sale.video.each do |content|
  #   content.tags.each { |tag| tags[tag] = 1 }
  #   add video_content_path(content.to_param), video: {
  #     thumbnail_loc: ImagesProvider::Client.build_url(content: content, type: :large),
  #     title: content.name,
  #     description: content.description.presence || content.tags.try(:join, ', ') || content.neural_description,
  #     content_loc: content.media,
  #     tags: content.tags
  #   }
  # end

  # All tags
  tags.each { |tag, _| add tag_path(tag: tag) }
end
