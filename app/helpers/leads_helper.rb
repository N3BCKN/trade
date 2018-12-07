module LeadsHelper
	def set_product_image_show(lead)
		if lead.product_image_file_name.nil?
			image_tag "default_product_image.png"
		else
			image_tag lead.product_image.url(:default)
		end
	end

	def set_product_image_index(lead)
		if lead.product_image_file_name.nil?
			image_tag "thumb_product_image.png"
		else
			image_tag lead.product_image.url
		end
	end
end
