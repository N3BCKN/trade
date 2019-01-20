# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    # custom searching methods
    def self.search_leads(query, status, filters = [])
      search(
               query: multi_match_query(query, status, filters),
               aggs:  aggregations,
               sort:  [{ "created_at": { order: 'desc' } }]
             )
      end

    def self.suggested_leads(lead)
      search(
              from: 0, size: 5,
              query:{
                range: {
                  created_at: {
                    gte: "now-180d/d",
                    lte: "now/d"
                  }
                },
                must: [
                  {
                    multi_match:{
                      query: lead.title,
                      fields: [
                        "title^8",
                        "country^3"
                      ]
                    }
                  },
                  {
                    match: 
                    { lead_status: lead.lead_status }
                  },
                  {
                    match:
                    { "category.name": lead.category.name }
                  },
                ]
              }
        )
    end

    def self.search_categories(category, status)
      search(
               query: {
                 bool: {
                   must:   {
                     match:
                            { "category.name": category }
                   },
                   filter: {
                     term:
                           { lead_status: status }
                   }
                 }
               },
               sort:  [{ "created_at": { order: 'desc' } }]
             )
      end

    def self.aggregations
      {
        group_by_country:  {
          terms:
                 { field: 'country',
                   size:  10 }
        },
        group_by_category: {
          terms: {
            field: 'category.name',
            size:  5
          }
        }
      }
      end

    def self.multi_match_query(query, status, filter)
      {
        bool: {
          must:   [
            {
              multi_match: {
                query:  query,
                fields: [
                  'title^7',
                  'country^3',
                  'city^2',
                  'category.name^3'
                ]
              }
            },
            {
              match:
                     { lead_status: status }
            }
          ],
          filter: filter
        }
      }
      end
  end
end
