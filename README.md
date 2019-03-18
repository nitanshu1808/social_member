# Introduction

Social Member is a social networking platform for members. It connects members with one another by sending friend requests. Furthermore, it consumes bitly webservices for shortening the url's.
The resultant urls html document headings are parsed.

# Ruby version
System uses ruby "2.4.1"   and  rails "5.2.0"

# Database creation
Relation Database used: sqlite3
use gem 'sqlite3' # for sqlite3
For a new application,try using 'rake db:schema:load'.
However if the application is already exists try running the command 'rake db:setup'


# How to run the test suite
The development follows test first code later process.
The test cases are implemented using Rspec in conjunction with capybara.
In order to run the test cases execute the command 'rspec' within the repository
It will run all the test cases.
Webmock gem has been used for stubbing and setting expectations on HTTP requests.

# IMPLEMENTATION

This covers the necessary steps to get the application up and running.

1. Install Ruby Version Manager (RVM), consider the link provided below for installation if needed
   https://rvm.io/
2. On successfully installing rvm install ruby version greater or equal '2.4.1'

3. Take a clone from github

4. On successfully installing sqlite3, run the following commands
  * rake db:setup  #This would create a database, load a schema and run the seed file of the application

5. Run bundle command within the repository inorder to install all the gems (packages).

7. In order to set up the configurations, consider the following steps
  1. Sign up on bitly i.e. URL shortening service and a link management platform.
  2. On signing up, it would provide the access token
  3. Copy the access token

8. Using a gem figaro
  1/ execute the command
  * bundle exec figaro install
  and add the following in the application.yml file
  * SHORTEN_API_URL:           "https://api-ssl.bitly.com/v3/shorten"
  * SHORTEN_API_ACCESS_TOKEN:  access_token


9. This would setup the application

10. In order to verify, run rspec with the repository. This would run all the tests.

11. Within the repository, run rails s and start working
