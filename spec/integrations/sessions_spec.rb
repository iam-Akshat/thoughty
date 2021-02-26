require 'rails_helper'

RSpec.describe 'users/show', type: :system do
  context "user is logged in" do
    let (:user) do 
        create(:user)
    end
    it 'renders root page when logged in' do
        session[:user_id] = user.id
        visit root_path
        expect(page).to have_path('/')
    end
end
end
