$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
name = "jira4r"
require "#{name}/version"

Gem::Specification.new name, "0.1.0" do |s|
  s.summary     = "Ruby library for controlling JIRA"
  s.homepage    = "https://github.com/grosser/jira4r"
  s.authors     = ["Michael Grosser", "bwalding", "remi"]
  s.email       = "michael@grosser.it"
  s.homepage    = "https://github.com/grosser/#{name}"
  s.files = `git ls-files lib`.split("\n")
  s.license = "Apache 2.0"
  cert = File.expand_path("~/.ssh/gem-private-key-grosser.pem")
  if File.exist?(cert)
    s.signing_key = cert
    s.cert_chain = ["gem-public_cert.pem"]
  end
end
