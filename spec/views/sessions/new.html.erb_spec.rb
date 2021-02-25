require 'rails_helper'

RSpec.describe "sessions/new", type: :view do

  it "renders new session form" do
    render
    expect(rendered).to have_content('Sign In')
  end
end
