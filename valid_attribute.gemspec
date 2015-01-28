$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "valid_attribute/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "valid_attribute"
  s.version     = ValidAttribute::VERSION
  s.authors     = ["Kevin Bongart"]
  s.email       = ["contact@kevinbongart.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ValidAttribute."
  s.description = "TODO: Description of ValidAttribute."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
