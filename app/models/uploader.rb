class Uploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

	def store_dir
		"photos"
	end
	
end
