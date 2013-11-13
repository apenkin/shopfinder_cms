module ShopfinderCms
  class Engine < ::Rails::Engine
    isolate_namespace ShopfinderCms

    initializer :shopfinder_cms do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/lib/shopfinder_cms/admin']
      #ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/shopfinder_cms/admin']
      #ActiveAdmin.application.load_paths += Dir['/Users/aleksandr/apps/shopfinder_cms/shopfinder_cms' + '/lib/shopfinder_cms/admin']
    end
  end
end
