require "appwebhouse/random_image/configuration/catalog"

module Appwebhouse
  module RandomImage
    class Configuration
      class << self
        attr_accessor :catalog
      end

      def register_catalog
        catalog = Catalog.new
        yield(catalog)

        CATALOGS << catalog
      end
    end
  end
end
