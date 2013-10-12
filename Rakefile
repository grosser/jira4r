require 'bundler/setup'
require 'bundler/gem_tasks'
require 'bump/tasks'

task :default do
  sh "rspec spec/"
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "jira4r"
    s.summary     = "Ruby library for controlling JIRA"
    s.email       = "remi@remitaylor.com"
    s.homepage    = "http://github.com/remi/jira4r"
    s.description = "Ruby library for controlling JIRA"
    s.authors     = %w( bwalding remi )
    s.files       = FileList["[A-Z]*", "{lib,spec,examples,rails_generators}/**/*"]
    # s.executables = "neato"
    # s.add_dependency 'person-project'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
