module PersonalDepartament
  class Attachment < ActiveRecord::Base
    validates :title, :description, :file_path, presence: true

    mount_uploader :file_path, FileUploader
  end
end
