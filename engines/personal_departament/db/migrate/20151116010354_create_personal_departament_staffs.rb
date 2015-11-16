class CreatePersonalDepartamentStaffs < ActiveRecord::Migration
  def change
    create_table :personal_departament_staffs do |t|

      t.references :contract, index: true
      t.references :sector, index: true
      t.references :job, index: true

      t.text :observation 

      t.string :name
      t.string :code
      t.string :rg 
      t.string :cpf 
      t.string :rg_org
      t.date   :rg_date
      t.string :cnh
      t.string :cnh_category
      t.string :cnh_uf
      t.string :ctps 
      t.string :ctps_serie
      t.string :pis
      t.string :voter_registration
      t.string :voter_zone
      t.string :voter_session
      t.string :reservist
      t.string :reservist_serial
      t.string :reservist_uf 
      t.date   :reservist_date
      t.date   :born

      t.string :bank
      t.string :bank_agency
      t.string :bank_account

      t.string :address
      t.string :burgh
      t.references :city, index: true
      t.references :state, index: true
      t.string :cep 

      t.string :telephone
      t.string :telephone_optional
      t.string :celphone
      t.string :email

      t.string :name_father
      t.string :name_mother
      t.integer :gender, default: 0
      t.string  :naturality
      t.integer :civil_state, default: 0
      
      t.string :spouse_name
      t.string :spouse_cpf
      t.string :education
      
      t.boolean :special_condition_flag, default: false
      t.string  :special_condition

      t.string :drt 
      t.string :registry
      t.string :number_book
      t.string :number_flet
      t.date   :admission

      t.float :salary, default: 0
      t.float :transportation_voucher, default: 0

      t.string :transportation_line
      t.string :transportation_company
      t.string :transportation_observation

      t.time :work_start, default: '08:00'
      t.time :work_end, default: '08:00'

      t.string :height
      t.string :weight
      t.string :blood
      
      t.text :medications
      t.text :diseases
      t.text :allergies

      t.string :tshirt_size
      t.string :pants_size
      t.string :skirt_size
      t.string :shoe_size

      t.string :badge_name
      t.string :badge_picture

      t.string :picture
      t.integer :situation, default: 0

      t.date :experience_start
      t.date :experience_end

      t.integer :staff_performance, default: 0
      t.text    :staff_performance_observation
      
      t.timestamps null: false
    end
  end
end
