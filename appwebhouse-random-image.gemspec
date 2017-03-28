# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'appwebhouse/random_image/version'

Gem::Specification.new do |s|
  s.name        = "appwebhouse-random-image"
  s.version     = Appwebhouse::RandomImage::VERSION
  s.authors     = "App&Web House"
  s.email       = ""
  s.homepage    = "https://www.facebook.com/appwebhouse"
  s.summary     = 'App&Web House random image'
  s.description = "Random image"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)
  s.add_dependency 'rails', '>= 4'
  s.add_dependency 'mini_magick'
  s.add_dependency 'rspec'
  s.add_dependency 'faker'
end
