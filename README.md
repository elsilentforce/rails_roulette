== README

# Rails Roulette
The following application simulates a simple Roulette. Is has been developed using Ruby on Rails, Rspec & Capybara

## Rules
* Every new player starts with 10.000 credits
* A round automatically starts every 3 minutes
* The bets may vary according to the weather

## System requeriments
This project has been made to run on UNIX systems, to run it you need `ruby@2.6.3` and `rails@4.2.11`

## Set up
To start de project you must execute the following commands:
```
bundle install
rake db:create
rake db:migrate
whenever --set 'environment=development' --update-crontab
```
Then you will be able to access to the app in: ['http://localhost:3000'](http://localhost:3000)

* Testing
You can run tests for this app executing:
```
bundle exec rspec
```
