# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "impresser/version"

Gem::Specification.new do |s|
  s.name        = "impresser"
  s.version     = Impresser::VERSION
  s.authors     = ["Matt Mayers"]
  s.email       = ["matt@mattmayers.com"]
  s.homepage    = "http://mattmayers.com"
  s.summary     = %q{Impresser rubifies your Wordpress}
  s.description = %q{Impresser is for those who want to marry their love of Wordpress with their lust for Ruby.}

  s.rubyforge_project = "impresser"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "activerecord", ">= 3.0.0"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  case RUBY_PLATFORM
  when 'java'
    s.add_runtime_dependency "jdbc-mysql"
  else
    s.add_runtime_dependency "mysql2"
  end
  s.add_runtime_dependency "phpass-ruby"
  s.add_runtime_dependency "composite_primary_keys"
  s.add_runtime_dependency "php_serialize"
end
