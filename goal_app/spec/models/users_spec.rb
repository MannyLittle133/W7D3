require 'rails_helper'

RSpec.descibe User, type: :model do 
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
end