require "builder"

Sass::Script::Number.precision = 14

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#  config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
page "/sitemap.xml", layout: false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
data.projects.each_with_index do |project, index|
    proxy "/projects/#{project.slug}.html", "/project.html", :locals => { :index => index }, :ignore => true
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Enables directory indexes
activate :directory_indexes

# http://bourbon.io
activate :bourbon

# https://github.com/middleman/middleman-syntax
activate :syntax

# https://github.com/tvaughan/middleman-deploy
activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = "ftp.sergioagosti.org"
  deploy.path     = "/2014/"
  deploy.user     = ""
  deploy.password = ""
end

# Methods defined in the helpers block are available in templates
helpers do
  def markdown(text)
     Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text)
  end
end

# this is the production base url
set :base_url, 'http://www.sergioagosti.org'

set :css_dir, 'styles'
set :js_dir, 'scripts'
set :images_dir, 'images'
set :markdown_engine, :redcarpet

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  #activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
