module Unit
  extend ActiveSupport::Concern
  included do 
    enum unit: ['un','kg','mt','cx','cm','lt']
  end
end