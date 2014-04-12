activate :automatic_image_sizes
activate :directory_indexes
activate :livereload
activate :syntax

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

ready do
  sprockets.append_path File.join root, 'bower_components'
end

set :haml, { ugly: true }

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
