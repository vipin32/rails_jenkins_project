require 'rails_helper'

RSpec.describe "Users API", type: :request do
  # Initialize test data
  let!(:users) { create_list(:user, 1) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users
  describe 'GET /users' do
    before { get '/users' }

    it 'returns users' do
      json = JSON.parse(response.body)  # Parse the response body
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /users
  describe 'POST /users' do
    let(:valid_attributes) { { user: {name: 'Jane Doe', email: 'jane.doe@example.com' }} }

    
    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }
      
      it 'creates a user' do
        json = JSON.parse(response.body)  # Parse the response body
        expect(json['name']).to eq('Jane Doe')
        expect(json['email']).to eq('jane.doe@example.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { user: {name: nil }} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/can't be blank/)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
