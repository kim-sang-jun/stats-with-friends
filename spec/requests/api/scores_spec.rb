require 'swagger_helper'

RSpec.describe 'Scores API', type: :request do
  path '/scores' do
    post 'Creates scores' do
      tags 'Scores'
      security [ bearer_auth: [] ]
      consumes 'application/json'
      parameter name: :scores, in: :body, schema: {
        type: :array,
        items: { '$ref' => '#/components/schemas/score' },
        required: [ 'username', 'seconds', 'published_at' ]
      }

      response '201', 'scores created' do
        let(:Authorization) { "Bearer #{JWT.encode "payload", ENV['SCORES_SECRET'], 'HS256' }" }

        let(:scores) do 
          [
            { username: 'testy', seconds: 5, published_at: Time.now },
            { username: 'foobar', seconds: 15, published_at: 5.minutes.ago },
          ]
        end 

        run_test!
      end

      response '400', 'bad request' do
        let(:Authorization) { "Bearer #{JWT.encode "payload", ENV['SCORES_SECRET'], 'HS256' }" }

        let(:scores) do 
          [
            { username: 'testy', published_at: Time.now },
            { username: 'foobar', seconds: 15, published_at: 5.minutes.ago },
          ]
        end

        run_test!
      end

      response '401', 'unauthorized' do
        let(:Authorization) { "Bearer #{JWT.encode 'payload', 'bad_pass', 'HS256' }" }

        let(:scores) do 
          [
            { username: 'testy', seconds: 5, published_at: Time.now },
            { username: 'foobar', seconds: 15, published_at: 5.minutes.ago },
          ]
        end 

        run_test!
      end
    end
  end
end
