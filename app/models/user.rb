require 'csv'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_contracts, class_name: "Access::UserContract"
  has_many :contracts, through: :user_contracts, class_name: "Commercial::Contract"
  has_many :orders, class_name: "Deal::Order"
  
  enum user_type: ['simples', 'solicitante', 'administrador']

  def self.to_csv
  	attributes = %w(id email)

  	CSV.generate(headers: true) do |csv|
  		csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
  	end
  end

end
