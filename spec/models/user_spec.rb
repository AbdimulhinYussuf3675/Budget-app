require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create do |user|
      user.name = 'Abdimulhin'
      user.email = 'example@gmail.com'
      user.password = '123df2'
    end
  end
  it 'is valid with a name, email, and password' do
    expect(subject).to be_valid
  end
end
