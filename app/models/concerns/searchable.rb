module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :content_xml, analyzer: 'english'
      end
    end

    def self.search(query)
      __elasticsearch__.search(
        {
          size: 100,
          query: {
            multi_match: {
              query: query,
              fields: ['content_xml^10', 'history']
            }
          }
        }
      )
    end
  end
end
