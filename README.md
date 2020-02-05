### Task description:
```
The test is as follows:
1. ruby_app

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:
  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
```

### How to install:
`bundle install`

### How to run app:
```
ruby parser.rb webserver.log
```

### How to run specs:
`rspec`

### Possible Improvements (ideas):
1. Validations like file does not exists and correct IP validations can be moved in a seperate file for more DRY and reusable approach.
2. It may allow to use specific IP addresses. Currently it's catching all the IP addresses.
3. Most views and unique views methods can be further divide into in multiple methods. Currently they are in one line.


### Approach used:
1. TDD first approach used.
2. I focused on DRY approach.
3. I focused on SOLID design principles while coding this task. Infact, I incorporate single responsibility and open/closed design principle. 
4. I incorporate dependency injection in the file `LogsParser` & `LogsView`.
5. Validations like file exists, file is not empty, IP and URL are covered in this project.

### Important files to view:
1. `parser.rb`
2. `lib/logs_parser.rb`
3. `lib/logs_view.rb`
4. `spec/`
