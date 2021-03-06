# Rails Roulette
The following application simulates a simple Roulette. Is has been developed using Ruby on Rails, Rspec & Capybara

## Rules
* Every new player starts with 10.000 credits
* A round automatically starts every 3 minutes
* The bets may vary according to the weather
* If a User has 1000 credits or less, it bets all on the current Round

## System requeriments
This project has been made to run on UNIX systems, to run it you need active Internet Connection, `ruby@2.6.3` and `rails@4.2.11`.
It also uses `cron` to run process in background, to do the trick the project uses `whenever` gem.

## Set up
To start de project you must execute the following commands:
```
bundle install
rake db:create
rake db:migrate
whenever --set 'environment=development' --update-crontab
```
Then you will be able to access to the app in: [http://localhost:3000](http://localhost:3000)

## Users CRUD
You can create, update, and delete users just visiting:
[http://localhost:3000/users](http://localhost:3000/users)

## Testing
You can run tests for this app executing:
```
bundle exec rspec
```
