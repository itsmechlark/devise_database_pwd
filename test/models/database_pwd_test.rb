require 'test_helper'

class DatabasePwdTest < ActiveSupport::TestCase
  test 'should respond to generate_password' do
    user = new_user
    assert user.respond_to?(:generate_password)
  end

  test 'should respond to generated_password' do
    user = new_user
    assert user.respond_to?(:generated_password)
  end

  test 'should set pwd when not set' do
    user = new_user
    assert user.save
    assert user.valid_password?(user.generated_password)
  end

  test 'should not set pwd when already set' do
    user = new_user(password: '12345678')
    assert user.save
    assert user.valid_password?('12345678')
  end
end
