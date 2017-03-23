require 'mini_magick'

module Appwebhouse
  module RandomImage
    autoload :Configuration, 'appwebhouse/random_image/configuration'

    CATALOGS = []

    def self.configure
      configuration = Configuration.new
      yield(configuration)
    end

    def self.random_image(catalog_name)
      catalog = find_catalog(catalog_name)

      catalog_files = Dir.glob(File.join(catalog.path, '**', '*'))
        .select { |file| File.file?(file) }

      random_file_number = rand(catalog_files.count)

      image = MiniMagick::Image.new(catalog_files[random_file_number])
      image.validate!

      image
    end

    def self.find_catalog(catalog_name)
      CATALOGS.find { |c| c.name == catalog_name }
    end
  end
end

require 'appwebhouse/random_image/engine'
require 'appwebhouse/random_image/mapper'
