module Deal
	class DocumentUploader < CarrierWave::Uploader::Base
	  
	  storage :fog

	  def store_dir
	    'uploads/deal/document'
	  end

	end
end