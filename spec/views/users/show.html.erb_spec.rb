# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, create(:user))
    session[:user_id] = @user.id
  end

  it 'renders user show page' do
    render
    expect(rendered).to have_content(@user.full_name)
  end
end
