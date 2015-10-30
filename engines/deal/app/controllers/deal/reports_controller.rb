require_dependency 'deal/application_controller'
module Deal
  class ReportsController < ApplicationController
    has_scope :period, :using => [:date_start, :date_end]
    has_scope :by_contract

    def contracts
      @contracts = Commercial::Contract.all.order(:title)
      @purchases = apply_scopes(Deal::Purchase).where(status: 1)
    end

    def by_contract
      @purchases = apply_scopes(Deal::Purchase).where(status: 1)
    end

    def by_products
    end
  end
end