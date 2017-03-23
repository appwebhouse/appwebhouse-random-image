module Appwebhouse
  module RandomImage
    class BaseController < ApplicationController
      def show
        catalog_name = params[:catalog_name].to_sym

        image = Appwebhouse::RandomImage.random_image(catalog_name)

        send_file image.path, disposition: "inline"
      end
    end
  end
end
