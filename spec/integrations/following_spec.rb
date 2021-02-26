require 'rails_helper'

RSpec.describe 'following', type: :system do
  context 'does not follow any user' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    before(:each) do
      visit root_path
      fill_in 'Username', with: user1.username
      click_on 'Login'
    end
    it 'shows follow button on unfollowed user show page' do
      visit user_path(user2)
      expect(page).to have_button('follow')
    end
    it 'shows unfollow button after clicking follow' do
      visit user_path(user2)
      click_on 'follow'
      expect(page).to have_button('unfollow', wait: 2)
    end
  end
end
