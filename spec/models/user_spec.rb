require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create do |user|
      user.name = 'Abdimulhin'
      user.email = 'example@gmail.com'
      user.password = '123df2'
    end
  end

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'name should be exist' do
    expect(subject.name).to eql('Abdimulhin')
  end

  it 'is valid with a name, email, and password' do
    expect(subject).to be_valid
  end

  it 'fails because password should have atleast 6 characters' do
    subject.password = '123'
    expect(subject).to_not be_valid
  end
end
