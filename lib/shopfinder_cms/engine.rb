module ShopfinderCms
  class Engine < ::Rails::Engine
    isolate_namespace ShopfinderCms

    initializer :shopfinder_cms do
      #ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/lib/shopfinder_cms/admin']
      ActiveAdmin.application.load_paths.unshift (File.dirname(__FILE__) + '/admin')
    end
  end
end
