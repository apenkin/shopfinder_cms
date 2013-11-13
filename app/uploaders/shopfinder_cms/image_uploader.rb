# encoding: utf-8
module ShopfinderCms
  class ImageUploader < CarrierWave::Uploader::Base

    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
    # include Sprockets::Helpers::RailsHelper
    # include Sprockets::Helpers::IsolatedHelper

    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def efficient_conversion(width, height)
      manipulate! do |img|
        img.combine_options do |c|
          c.quality     '100%'
          c.thumbnail   "#{width}x#{height}>"
          c.thumbnail   "#{width}x#{height}<"
          c.gravity     "center"
          c.extent      "#{width}x#{height}"
        end
        img
      end
    end

    version :small do
      process :efficient_conversion => [150 ,100]
    end

    version :tiny do
      process :efficient_conversion => [100, 66]
    end

    version :large do
      process :efficient_conversion => [300, 200]
    end
  end
end