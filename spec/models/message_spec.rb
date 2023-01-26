# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message do
  # TODO: Add Factory to generate this
  let!(:user) { User.new(username: 'test-username-1', password: 'passey-pass') }

  it 'validates a valid message' do
    message = Message.new(body: 'message-body', user: user)
    expect(message.valid?).to eq true
  end

  it 'fails validation when message does not have a body' do
    message = Message.new(user: user)
    expect(message.valid?).to eq false
  end
end
