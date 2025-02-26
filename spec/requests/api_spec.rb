require 'swagger_helper'

RSpec.describe 'Abalones API', type: :request do
  path '/abalones' do
    get 'Retrieves all abalones' do
      tags 'Abalones'
      produces 'application/json'

      response '200', 'abalones found' do
        run_test!
      end
    end

    post 'Creates an abalone' do
      tags 'Abalones'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :abalone, in: :body, schema: {
        type: :object,
        properties: {
          sex: { type: :string },
          length: { type: :number },
          diameter: { type: :number },
          height: { type: :number },
          whole_weight: { type: :number },
          shucked_weight: { type: :number },
          viscera_weight: { type: :number },
          shell_weight: { type: :number },
          rings: { type: :integer }
        },
        required: ['sex', 'length', 'diameter', 'height', 'whole_weight', 'shucked_weight', 'viscera_weight', 'shell_weight', 'rings']
      }

      response '201', 'abalone created' do
        let(:abalone) { { sex: 'M', length: 0.5, diameter: 0.4, height: 0.1, whole_weight: 0.8, shucked_weight: 0.3, viscera_weight: 0.2, shell_weight: 0.15, rings: 10 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:abalone) { { sex: '' } }
        run_test!
      end
    end
  end

  path '/abalones/{id}' do
    get 'Retrieves an abalone' do
      tags 'Abalones'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'abalone found' do
        let(:id) { Abalone.create(sex: 'F', length: 0.6, diameter: 0.45, height: 0.12, whole_weight: 0.9, shucked_weight: 0.4, viscera_weight: 0.25, shell_weight: 0.2, rings: 12).id }
        run_test!
      end

      response '404', 'abalone not found' do
        let(:id) { 999 }
        run_test!
      end
    end

    put 'Updates an abalone' do
      tags 'Abalones'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :abalone, in: :body, schema: {
        type: :object,
        properties: {
          sex: { type: :string },
          length: { type: :number }
        }
      }

      response '200', 'abalone updated' do
        let(:id) { Abalone.create(sex: 'F', length: 0.6, diameter: 0.45, height: 0.12, whole_weight: 0.9, shucked_weight: 0.4, viscera_weight: 0.25, shell_weight: 0.2, rings: 12).id }
        let(:abalone) { { sex: 'M', length: 0.7 } }
        run_test!
      end

      response '404', 'abalone not found' do
        let(:id) { 999 }
        let(:abalone) { { sex: 'M', length: 0.7 } }
        run_test!
      end
    end

    delete 'Deletes an abalone' do
      tags 'Abalones'
      parameter name: :id, in: :path, type: :integer

      response '204', 'abalone deleted' do
        let(:id) { Abalone.create(sex: 'F', length: 0.6, diameter: 0.45, height: 0.12, whole_weight: 0.9, shucked_weight: 0.4, viscera_weight: 0.25, shell_weight: 0.2, rings: 12).id }
        run_test!
      end

      response '404', 'abalone not found' do
        let(:id) { 999 }
        run_test!
      end
    end
  end
end
