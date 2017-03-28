require "appwebhouse/random_image/configuration/catalog"

module Appwebhouse
  module RandomImage
    class Configuration
      def register_catalog
        catalog = Catalog.new
        yield(catalog)

        if Appwebhouse::RandomImage::find_catalog(catalog.name)
          raise StandardError, <<-ERROR
            catalog name '#{catalog.name}' already in use
          ERROR
        end

        CATALOGS << catalog
      end
    end
  end
end
