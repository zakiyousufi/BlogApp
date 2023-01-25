require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET index' do
    before :each do
      get '/users'
    end

    it 'renders index' do
      expect(response).to render_template('users/index')
    end

    it 'returns code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body has the right placeholder' do
      expect(response.body).to include('Here is the list of users:')
    end
  end
end
