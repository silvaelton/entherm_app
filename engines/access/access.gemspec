$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "access/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "access"
  s.version     = Access::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Access."
  s.description = "TODO: Description of Access."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
