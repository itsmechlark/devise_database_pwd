require 'rails'
require 'active_support/concern'
require 'orm_adapter'
require 'devise'

# modules
Devise.add_module :database_pwd, model: 'devise_database_pwd/models/database_pwd'
