module Searchable
	extend ActiveSupport::Concern

	included do

	include Elasticsearch::Model
	
	settings index: { number_of_shards: 1 } do
	    mappings dynamic: false do
	      indexes :id, type: 'keyword'
	      indexes :lead_status, type: 'keyword'
	      indexes :country
	      indexes :city
	      indexes :title, analyzer: :english
	      indexes :description, analyzer: :english
	    end
    end

	 def self.search_offers(query)
	    self.search({
	        query: {
	          bool: {
	            must: [
	            {
	              multi_match: {
	                query: query,
	                fields: [:title, :description, :country, :city]
	              }
	            },
	            {
	              match: {
	                lead_status: "offer"
	              }
	            }]
	          }
	        }
	      })
	  end

	  def self.search_products(query)
	    self.search({
	      query: {
	        bool: {
	          must: [
	          {
	            multi_match: {
	              query: query,
	              fields: [:title, :description, :country, :city]
	            }
	          },
	          {
	            match: {
	              lead_status: "product"
	            }
	          }]
	        }
	      }
	    })
	  end

	  def as_indexed_json(options={})
	  self.as_json(
	    include: { category: {only: :name},
	               user:     {only: [:user_name, :id]}
	    })
	  end
	end 
end 