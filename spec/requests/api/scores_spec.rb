require 'swagger_helper'

RSpec.describe 'Scores API', type: :request do
  path '/scores' do
    post 'Creates scores' do
      tags 'Scores'
      consumes 'application/json'
      parameter name: :score, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          seconds: { type: :integer },
          published_at: { type: :datetime },
        },
        required: [ 'username', 'seconds', 'published_at' ]
      }

      response '201', 'scores created' do
        let(:score) { { username: 'testy', seconds: 5, published_at: Time.now  } }
        run_test!
      end
    end
  end
end
