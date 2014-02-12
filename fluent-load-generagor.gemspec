# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-load-generator"
  gem.description = "load generator"
  gem.homepage    = "https://github.com/kuenishi/fluent-load-generator"
  gem.summary     = gem.description
  gem.version     = File.read("VERSION").strip
  gem.authors     = ["Kota UENISHI"]
  gem.email       = "kuenishi@gmail.com"
  gem.has_rdoc    = false
  #gem.platform    = Gem::Platform::RUBY
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency "uuidtools", ">= 2.1.3"
  gem.add_development_dependency "rake", ">= 0.9.2"
  gem.add_development_dependency "simplecov", ">= 0.5.4"
  gem.add_development_dependency "rr", ">= 1.0.0"
end
