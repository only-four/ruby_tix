require 'rubygems'
require 'sitemap_generator'
# require 'google/cloud/storage'

SitemapGenerator::Sitemap.default_host = 'https://rubytix.fun'

# SitemapGenerator::Sitemap.sitemaps_host = "https://storage.googleapis.com/rubytix"
# SitemapGenerator::Sitemap.adapter = SitemapGenerator::GoogleStorageAdapter.new(
#   # Credentials or path/to/file
#   credentials: Rails.application.credentials.gcs_hooleapp_prd,
#   project_id: 'Rubytix',
#   bucket: 'rubytix'
# )


SitemapGenerator::Sitemap.create do
  add '/home', :changefreq => 'daily', :priority => 0.9
  add '/contact_us', :changefreq => 'weekly'
end

SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
