module SharedUser
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :database_pwd, :registerable
  end
end
