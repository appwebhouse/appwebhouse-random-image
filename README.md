# RandomImage

```console
$ rails generate random_image:install
```

`/config/initializers/random_image.rb`

```ruby
config.register_catalog do |catalog|
  catalog.path = "#{Rails.root}/catalog_name"
  catalog.name = :catalog_sym
end
```

`/config/routes.rb`

```ruby
random_image_for :catalog_sym, 'random_image'
```

```ruby
random_image_catalog_sym_path
```

```sass
.random-image {
  background-image: random_image_catalog_sym();
}
