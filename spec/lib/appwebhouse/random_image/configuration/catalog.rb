require 'spec_helper'

describe 'Appwebhouse::RandomImage::Catalog' do
  context 'register catalog' do
    context 'with valid params' do
      let(:catalog_name) { :catalog }
      let(:catalog_path) { '/path' }
      let(:catalog) do
        Appwebhouse::RandomImage::Catalog.new(catalog_name, catalog_path)
      end

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
      it do
        expect do
          Appwebhouse::RandomImage::Catalog.new('catalog', '/path')
        end.to raise_error(TypeError)
      end

      it do
        expect do
          Appwebhouse::RandomImage::Catalog.new(:catalog, :path)
        end.to raise_error(TypeError)
      end
    end
  end
end
