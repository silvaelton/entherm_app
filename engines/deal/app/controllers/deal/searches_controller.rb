require_dependency 'deal/application_controller'
module Deal
  class SearchesController < ApplicationController

    def index
      if params[:search_type].present?
        case params[:search_type]
        when 'PRODUTO'
          @products = PurchaseItem.where(product_id: params[:product])
        when 'FPA'
          fpa = params[:fpa].split('/')
          @fpa = Purchase.find(fpa[0]) rescue nil
        end
      end
    end

  end
end