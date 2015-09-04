require 'active_support/test_case'

class ActiveSupport::TestCase
  def generate_unique_email
    @@email_count ||= 0
    @@email_count += 1
    "test#{@@email_count}@example.com"
  end

  def new_user(attributes = {})
    User.new(valid_attributes(attributes))
  end

  def create_user(attributes = {})
    @user ||= begin
      User.create!(valid_attributes(attributes))
    end
  end

  def current_user(attributes = {})
    @@current_user ||= create_user(attributes)
  end

  # Execute the block setting the given values and restoring old values after
  # the block is executed.
  def swap(object, new_values)
    old_values = {}
    new_values.each do |key, value|
      old_values[key] = object.send key
      object.send :"#{key}=", value
    end
    clear_cached_variables(new_values)
    yield
  ensure
    clear_cached_variables(new_values)
    old_values.each do |key, value|
      object.send :"#{key}=", value
    end
  end

  def clear_cached_variables(options)
    if options.key?(:case_insensitive_keys) || options.key?(:strip_whitespace_keys)
      Devise.mappings.each do |_, mapping|
        mapping.to.instance_variable_set(:@devise_parameter_filter, nil)
      end
    end
  end

  def valid_attributes(attributes = {})
    { username: 'usertest',
      email: generate_unique_email,
      created_at: Time.now.utc
    }.update(attributes)
  end
end