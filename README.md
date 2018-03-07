# README

## Motivation
    An online app to organize secret santa( amigo secreto pt-br).
    include, exclude and raffle easy everybody will participate by email.

![Screenshot](https://github.com/rogeriobispo/amigo_secreto/blob/master/public/Captura%20de%20tela%20de%202018-03-05%2010-52-45.png)

## Badges

[ ![Codeship Status for rogeriobispo/amigo_secreto](https://app.codeship.com/projects/ad686050-0446-0136-7430-3e5b4a1ed234/status?branch=master)](https://app.codeship.com/projects/280439) [![Maintainability](https://api.codeclimate.com/v1/badges/055f87c64fa4d45686a8/maintainability)](https://codeclimate.com/github/rogeriobispo/amigo_secreto/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/055f87c64fa4d45686a8/test_coverage)](https://codeclimate.com/github/rogeriobispo/amigo_secreto/test_coverage)


## Requiriments
    * Ruby 2.3.6
    * Rails 5.0.6
    * Postgres 9.5
    * Redis
    * Sidekiq
    * MailCatcher

## Optional
    * docker
    * docker-compose

## Setup
    * git clone git@github.com:rogeriobispo/amigo_secreto.git
    * bundle install
    * rails db:create
    * rails db:migrate
    * puma -C config/puma.rb

## Docker Setup
   * docker-compose build
   * docker-compose run --rm app bin/setup
   * docker-compose up

## Server up
    * puma -C config/puma.rb

## Database creation
    * rails db:create

## Database Initialization
    * rails db:create
    * rails db:migrate

## How to run Test suite
    * rspec -fd


## App link

[Secret Santa](http://159.65.243.248) 
    available until: 2017-04-07
    email is blocked at digitalocian I'm working to solve it.


