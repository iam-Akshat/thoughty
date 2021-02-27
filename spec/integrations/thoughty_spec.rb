require 'rails_helper'

RSpec.describe 'thoughts', type: :system do
  context 'does not follow any user' do
    let(:user1) { create(:user) }
    before(:each) do
      visit root_path
      fill_in 'Username', with: user1.username
      click_on 'Login'
    end
    it 'shows thoughts when user posts' do
      fill_in 'thoughty_content', with: 'I posted'
      click_on 'Hear me'
      expect(page).to have_content('I posted', wait: 2)
    end
  end

  context 'follows other person' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    before do
      Following.create!(follower: user1, followed: user2)
      user2.thoughties.create!(content: 'heyy')
    end
    before(:each) do
      visit root_path
      fill_in 'Username', with: user1.username
      click_on 'Login'
    end

    it 'shows other users thoughts on home' do
      expect(page).to have_content('heyy')
    end
  end
end
