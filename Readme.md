Ruby library for controlling JIRA

Install
=======

```Bash
gem install jira4r
```

Usage
=====

```Ruby
require 'jira4r/jira4r'

jira = Jira::JiraTool.new(2, "http://jira.atlassian.com") # api-version, base-url
jira.login("soaptester", "soaptester")
puts jira.getProject("DEMO").inspect

#<RemoteProject:0x1425bc0 @projectUrl="http://jira.atlassian.com", @issueSecurityScheme=nil, @id="10820",...>
```

see examples folder for more details

TODO
====
 - Add more tests (run examples as test cases ?)
 - test + fix the various rake tasks in this project

Authors
=======

### [Contributors](https://github.com/grosser/jira4r/contributors)
 - Original author: James Stuart
 - [Remi Taylor](https://github.com/remi)

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: Apache v2<br/>
[![Build Status](https://travis-ci.org/grosser/jira4r.png)](https://travis-ci.org/grosser/jira4r)
