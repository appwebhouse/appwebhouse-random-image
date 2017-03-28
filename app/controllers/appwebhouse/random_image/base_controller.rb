module Appwebhouse
  module RandomImage
    class BaseController < ApplicationController
      def show
        catalog_name = params[:catalog_name].to_sym

        image = Appwebhouse::RandomImage.find_catalog(catalog_name).random_image

        send_file image.path, disposition: "inline"
      end
    end
  end
end
