$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deal/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deal"
  s.version     = Deal::VERSION
  s.authors     = ["Elton Silva"]
  s.email       = ["elton.chrls@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Deal."
  s.description = "TODO: Description of Deal."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"


  s.add_development_dependency "sqlite3"
end
