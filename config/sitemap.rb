# frozen_string_literal: true

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://www.cargocub.com'

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily'

  Category.find_each do |category|
    add offers_categories_path(category), changefreq: 'weekly', lastmod: category.updated_at
    add products_categories_path(category), changefreq: 'weekly', lastmod: category.updated_at

    category.leads.each do |lead|
      add lead_path(lead), changefreq: 'yearly', lastmod: lead.updated_at
    end
  end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
