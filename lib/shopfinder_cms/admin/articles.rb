if defined?(ActiveAdmin)
  ActiveAdmin.register ShopfinderCms::Article do
    menu parent: "Content", label: "Articles"
    controller do
      around_filter do |controller, action|
        ShopfinderCms::Article.class_eval do
          alias :__active_admin_to_param :to_param
          def to_param() id.to_s end
        end
        begin
          action.call
        ensure
          ShopfinderCms::Article.class_eval do
            alias :to_param :__active_admin_to_param
          end
        end
      end
    end
  end
end