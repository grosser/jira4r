require 'bundler/setup'
require 'bundler/gem_tasks'
require 'bump/tasks'

task :default do
  sh "rspec spec/"
end

task :console do
  if File.file? 'jira.yml'
    require 'yaml'
    config = YAML.load_file 'jira.yml'
  else
    puts "To setup your login credentials, you need to create a jira.yml file"
    puts "with something like:"
    puts "---\n:username: y\n:password: z\n:url: x"
    exit
  end

  require File.dirname(__FILE__) + '/lib/jira4r'

  puts "logging in ..."

  $jira = Jira::JiraTool.new 2, config[:url]
  $jira.login config[:username], config[:password]

  puts "done.  jira client variable: $jira"

  require 'irb'
  IRB.start
end
