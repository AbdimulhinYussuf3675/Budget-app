require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { User.create(name: 'abdimulhin', email: 'example@gmail.com', password: '123df2') }
  let(:group) { Group.create(name: 'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png', user:) }
  let(:operation) { Operation.create(name: 'Tomatoes', amount: 5, author: user) }
  it 'fails when name shis note present' do
    operation.name = nil
    expect(operation).to_not be_valid
  end

  it 'fails when amount is not be present' do
    operation.amount = nil
    expect(operation).to_not be_valid
  end

  it 'fails when amount is not be positive' do
    operation.amount = -5
    expect(operation).to_not be_valid
  end

  it 'fails when amount is not be a number' do
    operation.amount = 'test'
    expect(operation).to_not be_valid
  end

  it 'fails because it should have atleast 1 group' do
    expect(operation).to_not be_valid
  end
end
