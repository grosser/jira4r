gem 'soap2r'
require 'soap/rpc/driver'

require 'jira4r/jira_tool'

# Due to refactoring, this class should no longer be used.
module Jira
  class JiraTool

    def initialize(version, base_url)
      puts "Jira::JiraTool is deprecated; use Jira4R::JiraTool"
      @proxy = ::Jira4R::JiraTool.new(version, base_url)
    end

    def method_missing(name, *args)
      @proxy.send(name, *args)
    end
  end
end
