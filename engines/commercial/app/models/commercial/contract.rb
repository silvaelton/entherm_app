module Commercial
  class Contract < ActiveRecord::Base
    has_many :purchases, class_name: "Deal::Purchase"
    belongs_to :company

#    validates_presence_of :title, :company
    validates_uniqueness_of :title
  end
end
