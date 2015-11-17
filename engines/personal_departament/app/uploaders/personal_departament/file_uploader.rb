module Deal
  class FileUploader < CarrierWave::Uploader::Base
        
    storage :fog

    def store_dir
      'uploads/personal_departament'
    end

    def extension_white_list
      %w(jpg jpeg gif png)  
    end
  end
end