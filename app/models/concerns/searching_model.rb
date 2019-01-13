# frozen_string_literal: true

module SearchingModel
  extend ActiveSupport::Concern

  included do
    settings index: { number_of_shards: 6 } do
      mappings dynamic: false do
        indexes :id, type: 'long'
        indexes :lead_status, type: 'keyword'
        indexes :country, type: 'keyword'
        indexes :city, type: 'keyword'
        indexes :title, analyzer: 'english', index_options: 'offsets'
        indexes :created_at, type: 'date'
        indexes :category do
          indexes :name, type: 'keyword'
        end
        indexes :user do
          indexes :user_name, type: 'keyword'
          indexes :id, type: 'long'
        end
      end
    end

    def as_indexed_json(options = {})
      as_json(
        options.merge(
          only:    %i[id lead_status city title description_short created_at
                      country product_image_file_name],
          methods: :img_url_thumb,
          include: {
            category: { only: :name },
            user:     { only: %i[user_name id] }
          }
        )
      )
      end
  end
end
