require 'rails_helper'

RSpec.describe 'sessions', type: :system do
  context 'when user is logged in' do
    before(:each) do
      visit root_path
      user = create(:user)
      fill_in 'Username', with: user.username
      click_on 'Login'
    end
    it 'renders root page when logged in' do
      expect(current_path).to eq root_path
    end

    it 'redirects to sign_in page on logging out' do
      click_on 'Sign out'
      using_wait_time 2 do
        expect(current_path).to eq sign_in_path
      end
    end
  end
  context 'when user not logged in' do
    it 'root_path redirects to sign_in_path' do
      visit root_path
      expect(current_path).to eq sign_in_path
    end
  end
end
