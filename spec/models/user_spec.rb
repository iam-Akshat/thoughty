require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username).with_message('Username already taken') }
    it { should validate_length_of(:username).is_at_least(4).is_at_most(10)}
    
    it { should validate_presence_of :full_name }
    it { should validate_length_of(:full_name).is_at_most(35)}
  end

  describe "associations" do
    it { should have_many(:thoughties) }
  end
end
