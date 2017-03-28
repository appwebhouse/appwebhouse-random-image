require 'spec_helper'

describe 'Appwebhouse::RandomImage' do
  let(:catalog_path) { '/catalog' }
  let(:catalog_name) { :catalog }

  before do
    Appwebhouse::RandomImage.clear_catalogs

    Appwebhouse::RandomImage.configure do |config|
      config.register_catalog do |catalog|
        catalog.path = catalog_path
        catalog.name = catalog_name
      end
    end
  end

  context 'catalog' do
    context 'is registered' do
      it do
        result = Appwebhouse::RandomImage.catalog_exists?(catalog_name)
        expect(result).to be true
      end

      let(:catalog) { Appwebhouse::RandomImage.find_catalog(catalog_name) }

      it do
        expect(catalog).to be_truthy
      end

      it do
        expect(catalog.path).to eql(catalog_path)
      end

      it do
        expect(catalog.name).to eql(catalog_name)
      end

      it do
        expect(catalog.name).to eql(catalog_name)
      end
    end

    context 'is not registered' do
      let(:fake_catalog_name) { :fake_catalog }

      it do
        result = Appwebhouse::RandomImage.catalog_exists?(fake_catalog_name)
        expect(result).to be false
      end
    end

    context 'with invalid params' do
      let(:invalid_catalog_name) { Faker::Name.name }

      it do
        result = Appwebhouse::RandomImage.catalog_exists?(invalid_catalog_name)
        expect(result).to be false
      end

      it do
        result = Appwebhouse::RandomImage.find_catalog(invalid_catalog_name)
        expect(result).to be_falsey
      end
    end
  end
end
