require_dependency "deal/application_controller"

module Deal
  class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:show, :edit, :update, :destroy]
    before_action :set_suppliers, only: [:create]
    # GET /suppliers
    def index
      @suppliers = Supplier.all.order(:name)
    end

    # GET /suppliers/1
    def show
    end

    # GET /suppliers/new
    def new
      @supplier = Supplier.new
    end

    # GET /suppliers/1/edit
    def edit
    end

    # POST /suppliers
    def create
      @supplier = Supplier.new(supplier_params)
      
      respond_to do |format|

        format.html {
          if @supplier.save
            flash[:success] = t :success
            redirect_to action: 'index'
          else
            render :new
          end
        }

        format.js {
          @supplier.save
        }
      end
     
    end

    # PATCH/PUT /suppliers/1
    def update
      if @supplier.update(supplier_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /suppliers/1
    def destroy
      if @supplier.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_supplier
        @supplier = Supplier.find(params[:id])
      end

      def set_suppliers
        @suppliers = Supplier.all.order(:name)
      end

      # Only allow a trusted parameter "white list" through.
      def supplier_params
        params.require(:supplier).permit(:supplier_category_id, :cnpj, :name, :state_id, :city_id, :address, 
                                         :address_complement, :cep, :contact_name, :contact_email, :contact_telephone,
                                         :contact_telephone_optional, :contact_celphone, :contact_celphone_optional,
                                         :observation)
      end
  end
end
