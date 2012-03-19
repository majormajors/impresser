# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "presser/version"

Gem::Specification.new do |s|
  s.name        = "presser"
  s.version     = Presser::VERSION
  s.authors     = ["Matt Mayers"]
  s.email       = ["matt@mattmayers.com"]
  s.homepage    = "http://mattmayers.com"
  s.summary     = %q{Presser rubifies your Wordpress}
  s.description = %q{Presser is for those who want to marry their love of Wordpress with their lust for Ruby.}

  s.rubyforge_project = "presser"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "activerecord", ">= 3.0.0"
  s.add_development_dependency "sqlite3-ruby"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  case RUBY_VERSION
  when /^1\.9/
    s.add_development_dependency "ruby-debug19"
  else
    s.add_development_dependency "ruby-debug"
  end
  s.add_runtime_dependency "mysql2"
  s.add_runtime_dependency "phpass-ruby"
  s.add_runtime_dependency "composite_primary_keys"
end
