# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'validates a valid user' do
    user = User.new(username: 'test-username', password: 'test-password')
    expect(user.valid?).to eq true
  end

  username_input = [
    { input: '' },
    { input: 'a' },
    { input: 'ab' },
    { input: 'aaaaaaaaaaaaaaaa' }
  ]

  username_input.each do |t|
    describe "Given username input #{t[:input]}" do
      it 'fails validation' do
        user = User.new(username: t[:input], password: 'test-password')
        expect(user.valid?).to eq false
      end
    end
  end

  it 'fails validation when username not provided' do
    user = User.new(password: 'test-password')
    expect(user.valid?).to eq false
  end
end
