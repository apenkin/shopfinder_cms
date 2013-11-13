if defined?(ActiveAdmin)
  ActiveAdmin.register ShopfinderCms::Item do
    menu parent: "Content", label: "News"
    controller do
      around_filter do |controller, action|
        ShopfinderCms::Item.class_eval do
          alias :__active_admin_to_param :to_param
          def to_param() id.to_s end
        end
        begin
          action.call
        ensure
          ShopfinderCms::Item.class_eval do
            alias :to_param :__active_admin_to_param
          end
        end
      end
    end
  end
end