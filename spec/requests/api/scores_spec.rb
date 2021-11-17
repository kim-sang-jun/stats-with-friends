require 'swagger_helper'

RSpec.describe 'Scores API', type: :request do
  path '/scores' do
    post 'Creates scores' do
      tags 'Scores'
      consumes 'application/json'
      parameter name: :scores, in: :body, schema: {
        type: :array,
        items: {
          type: :object,
          properties: {
            username: { type: :string },
            seconds: { type: :integer },
            published_at: { type: :datetime },
          },
        },
        required: [ 'username', 'seconds', 'published_at' ]
      }

      response '201', 'scores created' do
        let(:scores) do 
          [
            { username: 'testy', seconds: 5, published_at: Time.now },
            { username: 'foobar', seconds: 15, published_at: 5.minutes.ago },
          ]
        end 

        run_test!
      end

      response '400', 'bad request' do
        let(:scores) do 
          [
            { username: 'testy', published_at: Time.now },
            { username: 'foobar', seconds: 15, published_at: 5.minutes.ago },
          ]
        end

        run_test!
      end
    end
  end
end
