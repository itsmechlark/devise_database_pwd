module Devise
  module Models
    # DatabasePwd Module, responsible for setting password when password is not set.
    module DatabasePwd
      extend ActiveSupport::Concern

      included do
        attr_reader :generated_password

        before_validation :generate_password
      end

      def generate_password
        unless self.respond_to?(:password=)
          return fail '`:database_pwd` module is dependent to `:database_authenticable`. ' \
            "Add `devise :database_authenticable` to #{self.class}"
        end
        return if self.encrypted_password?

        @generated_password = Devise.friendly_token.first(8)

        self.password = generated_password
      end
    end
  end
end
