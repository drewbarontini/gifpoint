require 'uglifier'

# ====================================
#   Activate Plugins
# ====================================

activate :automatic_image_sizes
activate :directory_indexes
activate :livereload
activate :syntax

# ====================================
#   Global Variables
# ====================================

set :page_title, 'GIFPoint'

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# ====================================
#   Ready
# ====================================

ready do
  sprockets.append_path File.join root, 'bower_components'
end

# ====================================
#   Build Configuration
# ====================================

configure :build do
  activate :minify_css
  activate :minify_javascript, :compressor => ::Uglifier.new(:mangle => false)
  activate :relative_assets
end
