require_dependency 'deal/application_controller'

module Deal
  class PatrimonyMovimentsController < ApplicationController 

    has_scope :by_period, :using => [:date_start,:date_end]
    has_scope :contract
    has_scope :moviment_type

    def index
      @moviments = apply_scopes(PatrimonyMoviment).all.order('created_at DESC')
    end

    def new
      @moviment = PatrimonyMoviment.new
    end

    def create
      @moviment = PatrimonyMoviment.new(set_params)

      if @moviment.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end
    
    def view
      @moviment = PatrimonyMoviment.find(params[:patrimony_moviment_id])
    end
    
    private
    
    def set_params
      params.require(:patrimony_moviment).permit(:origin_contract_id, :moviment_type,
                                                 :current_contract_id, :observation, :responsible, 
                                                 items_id: [])
    end
  end
end