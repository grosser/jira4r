name = "jira4r"

Gem::Specification.new name, "1.3.0" do |s|
  s.summary     = "Ruby library for controlling JIRA"
  s.homepage    = "https://github.com/grosser/jira4r"
  s.authors     = ["Michael Grosser", "bwalding", "remi"]
  s.email       = "michael@grosser.it"
  s.homepage    = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib`.split("\n")
  s.license = "Apache 2.0"
  s.add_runtime_dependency "soap4r-ng", "~> 2.0"
end
