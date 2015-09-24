module Deal
  class Quotation < ActiveRecord::Base
    belongs_to :contract
    belongs_to :order
    belongs_to :file_path
  end
end
