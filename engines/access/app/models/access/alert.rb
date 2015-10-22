module Access
  class Alert < ActiveRecord::Base
    belongs_to :user
    
    scope :actives, -> { where(status: true).order('created_at DESC') }
    
    enum priority: ['alta', 'media','baixa']
    enum color: ['verde', 'azul','vermelha', 'amarela']
      
    validates :title, :content, :priority, :color, presence: true

    validates_date :expiration, after: (Date.today - 1.day), allow_blank: true
  end
end
