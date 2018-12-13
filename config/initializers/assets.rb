Rails.application.config.assets.enabled = true
Rails.application.config.assets.initialize_on_precompile = true
Rails.application.config.assets.version = '1.1'

Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'javascripts', 'tinymce', 'plugins', 'lobstertag')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'lobster-ui', 'public')

Rails.application.config.assets.precompile += %w( *.png *.gif *.jpg *.jpeg )
Rails.application.config.assets.precompile += %w( *.mp4 )
Rails.application.config.assets.precompile += %w( *.svg *.eot *.woff *.ttf )
Rails.application.config.assets.precompile += %w( plugin.js svgcheckbx.js )
Rails.application.config.assets.precompile += %w( api/playground.js api/playground-page.js )
