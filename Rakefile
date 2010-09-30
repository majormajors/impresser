require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "presser"
    gem.summary = %Q{Presser rubifies your Wordpress}
    gem.description = %Q{Presser gives your rubies the game they need to hook up with your Wordpress}
    gem.email = "matt@mattmayers.com"
    gem.homepage = "http://github.com/mmayers/presser"
    gem.authors = ["major_majors"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "yard", ">= 0"
    gem.add_development_dependency "mysql2", ">= 0"
    gem.add_development_dependency "activerecord", ">= 3.0.0"
    gem.add_development_dependency "dm-core", ">= 1.0.0"
    gem.add_development_dependency "sequel", ">= 3.15.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
