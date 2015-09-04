lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'devise_database_pwd/version'

Gem::Specification.new do |s|
  s.name          = 'devise_database_pwd'
  s.version       = DeviseDatabasePwd::VERSION.dup
  s.platform      = Gem::Platform::RUBY
  s.licenses      = ['MIT']
  s.authors       = ['John Chlark Sumatra']
  s.email         = ['jcsumatra@cdasia.com']
  s.homepage      = 'https://github.com/itsmechlark/devise_database_pwd'

  s.summary       = 'System generated password for devise'
  s.description   = 'Generate password for devise when password not set.'

  s.files         = `git ls-files`.split("\n") - %w(.gitignore .travis.yml .coveralls.yml)
  s.test_files    = s.files.grep(/^test/)
  s.require_paths = ['lib']
  s.extra_rdoc_files      = %w(LICENSE.txt README.md)

  s.add_dependency('devise', '>= 2.0.0')
end
