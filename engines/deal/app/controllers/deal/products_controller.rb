module Deal
  class ProductsController < ApplicationController
    
    def index
      @products = Product.all.order(:title)

      respond_to do |format|
        format.js   { render json: Product.where("title like ?", "%#{params[:term]}%").map(&:title) }
        format.html { @products}
      end
    end

  end
end