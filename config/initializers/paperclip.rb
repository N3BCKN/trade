# Paperclip::Attachment.default_options[:storage] = :gcs
# Paperclip::Attachment.default_options[:gcs_bucket] = ENV.fetch("GCS_BUCKET")
# Paperclip::Attachment.default_options[:default_url] = "/images/:style/default_product_image.png"
# Paperclip::Attachment.default_options[:path] = ":class/:attachment/:id/:style/:filename"
# Paperclip::Attachment.default_options[:gcs_permissions] = :public_read
# Paperclip::Attachment.default_options[:gcs_credentials] = {
#     project: ENV.fetch("GCS_PROJECT"),
#     keyfile: "#{Rails.root}/config/gcs.json",
# }