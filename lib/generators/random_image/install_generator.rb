module RandomImage
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Copy locale config file to your application."

    def copy_initializer
      template "initializers/random_image.rb", "config/initializers/random_image.rb"
    end
  end
end
