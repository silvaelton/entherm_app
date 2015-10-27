require_dependency 'deal/application_controller'
module Deal
  class PurchasesController < ApplicationController
    before_action :authenticate!
    before_action :set_purchase, only: [:edit, :destroy, :update, :show]
    before_action :set_session, only: [:edit, :show, :destroy]

    has_scope :period,:using => [:date_start, :date_end], :type => :hash
    has_scope :status
    has_scope :by_contract

    def index
      if params[:period]
        @purchases = apply_scopes(Purchase).all.order('id DESC')
      else
        @purchases = Purchase.this_month
      end

      respond_to do |format|
        format.html
        format.csv { send_data @purchases.to_csv, filename: "compras-#{Date.today}.csv" }
      end
    end

    def new
      @purchase = Purchase.new
    end

    def create
      @purchase = Purchase.new(set_params)
        
      if @purchase.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def show
    end


    def fpa
      @purchase = Purchase.find(params[:purchase_id])
      render layout: 'blank_print'
    end

    def edit
    end

    def update
      if @purchase.update(set_params)
        flash[:success] = t :success
        redirect_to purchases_path(search: session[:search])
      else
        render action: 'edit'
      end
    end

    def destroy
      if @purchase.destroy
        flash[:success] = t :success
        redirect_to purchases_path(search: session[:search])
      end
    end

    private

    def set_session
      session[:search] = params[:search] if params[:search].present?
    end

    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def set_params
      params.require(:purchase).permit(:description, :contract_id, :status, :purchase_type, :quotation_id, :supplier_id,
                                       :invoice_number, :invoice_file, :icms, :inventory_flag, :created_at, :seller, :requester, :carrier_id, :buy_type, :form_payment, :deadline_payment, :delivery, :freight,:contract_value,
                                        purchase_items_attributes: [:product_title, :unit_value, :contract_value, :total_value, :unit, :quantity, :id, :_destroy])
    end

    def authenticate!
      redirect_to orders_path if current_user.solicitante?
    end

  end
end