require 'rails_helper'

RSpec.describe Thoughty, type: :model do
  describe "validations" do
    it { should validate_presence_of(:content) } 
    it { should validate_length_of(:content).is_at_most(50) }
  end

  describe "associations" do
    it { should belong_to(:author) }
  end
end
