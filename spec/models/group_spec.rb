require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'abdimulhin', email: 'example@gmail.com', password: '123df2') }
  let(:group) { Group.create(name: 'Groceries', icon: 'https://cdn-icons-png.flaticon.com/512/3724/3724720.png', user:) }

  it 'fails when name is not be present' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'fails when icon is not be present' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end
