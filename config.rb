require 'uglifier'

activate :automatic_image_sizes
activate :directory_indexes
activate :livereload
activate :syntax

set :page_title, 'GIFPoint'

ready do
  sprockets.append_path File.join root, 'bower_components'
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript, :compressor => ::Uglifier.new(:mangle => false)
  activate :relative_assets
end
