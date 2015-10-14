module Deal
	class ImageUploader < CarrierWave::Uploader::Base
	  
	  
	  storage :fog

	  def store_dir
	    'uploads/deal'
	  end

	  def extension_white_list
    	%w(jpg jpeg gif png)	
  	end
	end
end