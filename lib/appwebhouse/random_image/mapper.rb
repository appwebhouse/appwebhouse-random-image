require "sass"
require "cgi"

module ActionDispatch::Routing
  class Mapper
    def random_image_for(catalog_name, path)
      catalog = Appwebhouse::RandomImage.find_catalog(catalog_name)
      route_name = :"random_image_#{catalog.name}"

      Rails.application.routes.draw do
        get path, to: 'appwebhouse/random_image/base#show',
          catalog_name: catalog.name, as: route_name
      end

      Sass::Script::Functions.redefine_method route_name do
        result = Rails.application.routes.url_helpers
          .send("#{route_name}_path")

        result = "url('#{result}')"

        Sass::Script::String.new(result)
      end
    end
  end
end
