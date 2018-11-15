module LeadsHelper
	def set_product_image(lead)
		if lead.product_image_file_name.nil?
			image_tag "default_product_image.png"
		else
			image_tag leads.product_image.url
		end
	end
end
