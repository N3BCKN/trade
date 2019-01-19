# frozen_string_literal: true

module LeadsHelper
	def set_product_image_show(lead, img_id = nil)
		if lead.product_image_file_name.nil?
			image_tag "default_product_image.png", id: img_id, class: "img-fluid"
		else
			image_tag lead.product_image.url(:default), id: img_id, class: "img-fluid"
		end
	end

  # for Elasticseach
  def set_product_image_index(lead)
    if lead.product_image_file_name.nil?
      image_tag 'thumb_product_image.png'
    else
      image_tag lead.img_url_thumb
    end
  end

  # for ActiveRecords
  def set_product_image_index_profile(lead)
    if lead.product_image_file_name.nil?
      image_tag 'thumb_product_image.png'
    else
      image_tag lead.product_image.url(:thumb)
    end
  end
end
