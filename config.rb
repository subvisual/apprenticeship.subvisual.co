###
# Page options, layouts, aliases and proxies
###

Slim::Engine.disable_option_validator!

require 'font-awesome-sass'

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

page 'sitemap.html', layout: false
page 'sitemap.xml', layout: false
page 'feed.xml', layout: false

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

###
# Helpers
# Built in custom helpers live in /helpers/custom_template_helpers.rb
###

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse IO.read("#{root}/.bowerrc")
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

after_configuration do
  %w(javascripts stylesheets images).each do |dir|
    sprockets.append_path File.join "#{root}", "blue/#{dir}"
  end

  sprockets.import_asset "blue/subvisual_separator.svg"
  sprockets.import_asset "blue/link-arrow.svg"
  sprockets.import_asset "blue/link-arrow-white.svg"
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'partials'

activate :autoprefixer
activate :directory_indexes
activate :es6

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # github.com/yterajima/middleman-robots
  # Make sure this stays on the bottom
  activate :robots, rules: [
    { user_agent: '*', allow: ['/'] }
  ],
  sitemap: "#{data.site.url}/sitemap.xml"
end
