require 'rails'
require 'responders'

module Appwebhouse
  module RandomImage
    autoload :Configuration, 'appwebhouse/random_image/configuration'
    autoload :Catalog, 'appwebhouse/random_image/configuration/catalog'

    CATALOGS = []

    def self.configure
      configuration = Configuration.new
      yield(configuration)
    end

    def self.find_catalog(catalog_name)
      CATALOGS.find { |c| c.name == catalog_name }
    end

    def self.catalog_exists?(catalog_name)
      self.find_catalog(catalog_name) != nil
    end

    def self.clear_catalogs
      CATALOGS.clear
    end
  end
end

require 'appwebhouse/random_image/engine'
require 'appwebhouse/random_image/mapper'
