require 'mini_magick'

module Appwebhouse
  module RandomImage
    class Catalog
      attr_reader :name, :path

      def initialize(name = nil, path = nil)
        self.name = name unless name.nil?
        self.path = path unless path.nil?
      end

      def name=(name)
        unless name.instance_of? Symbol
          raise TypeError, <<-ERROR
            no implicit conversion of #{name.class} into Symbol
          ERROR
        end

        @name = name
      end

      def path=(path)
        unless path.instance_of? String
          raise TypeError, <<-ERROR
            no implicit conversion of #{path.class} into String
          ERROR
        end

        @path = path
      end

      def random_image
        catalog_files = Dir.glob(File.join(@path, '**', '*'))
          .select { |file| File.file?(file) }

        random_file_number = rand(catalog_files.count)

        image = MiniMagick::Image.new(catalog_files[random_file_number])
        image.validate!

        image
      end
    end
  end
end
