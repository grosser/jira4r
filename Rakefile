require 'bundler/setup'
require 'bundler/gem_tasks'
require 'bump/tasks'
require 'net/http'
require 'fileutils'
require 'rake/clean'
require 'logger'

task :default do
  sh "rspec spec/"
end

# No idea if this actually works after this point .. give it a try and let me know :)

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

#require 'wsdl/soap/wsdl2ruby' # TODO this just blows up...

logger = Logger.new(STDERR)
logger.level = Logger::INFO
versions = [2]

desc "gets the wsdl files for JIRA services"
task :getwsdl do
  versions.each do |version|
    File.write(getWsdlFileName(version), get_file("test.jira.codehaus.org", "/rpc/soap/jirasoapservice-v#{version}?wsdl"))
  end
end

task :clean do
  File.unlink("wsdl/jirasoapservice-v2.wsdl")
  File.unlink("lib/jira4r/v2/jiraService.rb")
  File.unlink("lib/jira4r/v2/jiraServiceDriver.rb")
  File.unlink("lib/jira4r/v2/jiraServiceMappingRegistry.rb")
end

desc "generate the wsdl"
task :generate do
  versions.each { |version|
    wsdl = getWsdlFileName(version)
    basedir = "lib/jira4r/v#{version}"
    mkdir_p basedir

    if not File.exist?(wsdl)
      raise "WSDL does not exist: #{wsdl}"
    end
    wsdl_url = "file://#{File.expand_path(wsdl)}"

    # Create the server
    worker = WSDL::SOAP::WSDL2Ruby.new
    worker.logger = logger
    worker.location = wsdl_url
    worker.basedir = basedir
    worker.opt['force'] = true
    worker.opt['classdef'] = "jiraService"
    worker.opt['module_path'] ="Jira4R::V#{version}"

    worker.opt['mapping_registry'] = true
    #worker.run

    #Create the driver
    #worker = WSDL::SOAP::WSDL2Ruby.new
    #worker.logger = logger
    #worker.location = wsdl_url
    #worker.basedir = basedir
    #worker.opt['force'] = true
    #worker.opt['module_path'] = "Jira4R::V#{version}"

    worker.opt['driver'] = "JiraSoapService"
    worker.run
  }
end

def get_file(host, path)
  puts "getting http://#{host}#{path}"
  http = Net::HTTP.new(host)
  http.start { |w| w.get2(path).body }
end

def getWsdlFileName(vName)
  "wsdl/jirasoapservice-v#{vName}.wsdl"
end

def fix_soap_files(version)
  fix_require("lib/jira4r/v#{version}/jiraServiceMappingRegistry.rb")
  fix_require("lib/jira4r/v#{version}/JiraSoapServiceDriver.rb")
end

def fix_require(filename)
  content = ""
  File.open(filename) do |io|
    content = io.read()

    content = fix_content(content, 'jiraService')
    content = fix_content(content, 'jiraServiceMappingRegistry')
  end

  File.write(filename, content)
end

def fix_content(content, name)
  content.gsub("require '#{name}.rb'", "require File.dirname(__FILE__) + '/#{name}.rb'")
end
