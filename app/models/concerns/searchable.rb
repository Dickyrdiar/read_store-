module Searchable
    extend ActiveSupport::Concern 
    
    included do 
        include Elasticsearch::Model 
        include Elasticsearch::Model::Callbacks 

        def as_indexed_json(_options = {})
            as_json(only: %i[name_book])
        end 

        settings settings_attributes do
            mappings dynamic: false do
                indexes :name_book, type: :string, analyzer: :autocomplete
                indexes :category, type: :keyword 
                indexes :store, type: :string 
            end  
        end 

        def self.seacrh(query, filters)
            set_filters = lambda do |context_type, filter| 
                @search_definition[:query][:bool][context_type] |=[filter]
            end 

            @search_definition = {
                size: 6, 
                query: {
                    bool: {
                        must: [], 
                        should: [], 
                        filter: []
                    }
                }

                if query.blank? 
                    set_filters.call(:must, match_all: {})
                else 
                    set_filters.call(
                        :must, 
                        match: {
                            name: {
                                query: query, 
                                fuzziness: 1
                            }
                        }
                    )
                end 

                if filters[:]
            }
        end 
    end 
end 