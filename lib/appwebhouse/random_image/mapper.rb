require "sass"
require "cgi"

module ActionDispatch::Routing
  class Mapper
    def random_image_for(catalog_name, route_path)
      unless catalog_name.instance_of? Symbol
        raise TypeError, <<-ERROR
          no implicit conversion of #{catalog_name.class} into Symbol
        ERROR
      end

      unless route_path.instance_of? String
        raise TypeError, <<-ERROR
          no implicit conversion of #{route_path.class} into String
        ERROR
      end

      catalog = Appwebhouse::RandomImage.find_catalog(catalog_name)

      unless catalog
        raise StandardError, <<-ERROR
          no catalog can be found
        ERROR
      end

      route_name = :"random_image_#{catalog.name}"

      Rails.application.routes.draw do
        get route_path, to: 'appwebhouse/random_image/base#show',
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
