require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let :user do
    User.find_or_create_by(email: 'example@gmail.com') do |user|
      user.name = 'adam'
      user.password = Devise.friendly_token.first(8)
      user.confirmed_at = Time.now
    end
  end

  before(:each) do
    login_as(user)
  end

  describe 'GET /index' do
    it 'returns a 200 status response' do
      get groups_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should have the correct path' do
      get groups_path
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns a 200 status response' do
      get new_group_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'should have the correct path' do
      get new_group_path
      expect(response).to render_template(:new)
    end
  end
end
