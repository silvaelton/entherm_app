module Deal
	class DocumentUploader < CarrierWave::Uploader::Base
	  
	  storage :fog

	  def store_dir
	    'uploads/deal'
	  end

	  def extension_white_list
    	%w(pdf doc docx xls xlsx csv eof)
  	end
	end
end