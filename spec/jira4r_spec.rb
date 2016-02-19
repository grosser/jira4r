require 'spec_helper'
require 'jira4r/jira_tool'

TEST_BASE_URL = 'http://localhost/'

describe Jira4R::JiraTool do
  it "has an 'enhanced' attribute" do
    expect(Jira4R::JiraTool.new(2,TEST_BASE_URL)).to respond_to(:enhanced)
  end
end
