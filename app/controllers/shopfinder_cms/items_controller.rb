require_dependency "shopfinder_cms/application_controller"

module ShopfinderCms
  class ItemsController < ApplicationController
    inherit_resources
    respond_to :html
    actions :index, :show
    layout 'shopfinder_cms'
    before_filter :check_id, :only => [:show]

    protected
    def collection
      @items ||= end_of_association_chain.published.order('id desc').page(params[:page]).per(10)
    end

    def check_id
      params[:id] = params[:id].split(/-/).last if params[:id].present?
    end
  end
end
