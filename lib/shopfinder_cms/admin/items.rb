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

    index do
      column :id
      column :title
      default_actions
    end
    form do |f|
      f.inputs "Admin Details" do
        f.input :title
        f.input :text, :input_html => {:rows => 6}
        f.input :short_text
        f.input :image
        f.input :published_at, :as => :datepicker
        f.input :meta_title
        f.input :meta_description
        f.input :meta_keywords
        f.input :slug
        f.buttons
      end
    end
  end
end