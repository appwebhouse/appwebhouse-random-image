require 'spec_helper'

describe 'Appwebhouse::RandomImage::Configuration' do
  context 'register catalog' do
    context 'with valid params' do
      let(:catalog_name) { :catalog }
      let(:catalog_path) { '/catalog' }

      before do
        Appwebhouse::RandomImage.clear_catalogs

        Appwebhouse::RandomImage.configure do |config|
          config.register_catalog do |catalog|
            catalog.name = catalog_name
            catalog.path = catalog_path
          end
        end
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
    end

    context 'with invalid params' do
      let(:catalog_path) { :catalog_path }

      it do
        expect do
          Appwebhouse::RandomImage.configure do |config|
            config.register_catalog do |catalog|
              catalog.path = catalog_path
            end
          end
        end.to raise_error(TypeError)
      end

      let(:catalog_name) { 'catalog name' }

      it do
        expect do
          Appwebhouse::RandomImage.configure do |config|
            config.register_catalog do |catalog|
              catalog.name = catalog_name
            end
          end
        end.to raise_error(TypeError)
      end
    end
  end
end
