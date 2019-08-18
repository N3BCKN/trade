# frozen_string_literal: true

module LeadsHelper
  def set_product_image_show(lead, img_id = nil)
    if lead.product_image_file_name.nil?
      image_tag 'default_product_image.png', id: img_id, class: 'img-fluid'
    else
      image_tag lead.product_image.url(:default), id: img_id, class: 'img-fluid'
    end
  end

  def set_product_image_index(lead, width = 170, height = 170, bootstrapClass = '')
    if lead.product_image_file_name.nil?
      image_tag 'thumb_product_image.png', width: width, height: height, class: bootstrapClass
    else
      image_tag lead.product_image.url(:default), width: width, height: height, class: bootstrapClass
    end
  end

  # for ElasticSearch
  def set_product_image_elasticsearch(lead)
    if lead.img_url_thumb == 'default_image'
      image_tag 'thumb_product_image.png', width: 150, height: 110, class: 'img-responsive'
    else
      image_tag lead.img_url_thumb, width: 150, height: 110, class: 'img-responsive'
    end
  end
end
