module ShopfinderCms
  module Generators

    class ViewsGenerator < Rails::Generators::Base
      desc "Copies ShopfinderCms views to your application."

      include Thor::Actions

      source_root File.expand_path('../../../../app/views', __FILE__)

      # Copy all of the views from the blogit/app/views/shopfinder_cms to
      # app/views/shopfinder_cms
      def copy_views
        directory 'shopfinder_cms', 'app/views/shopfinder_cms'
        directory 'layouts', 'app/views/layouts'
      end

    end
  end
end