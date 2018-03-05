# README

## Motivation
    An online app to organize secret santa( amigo secreto pt-br).
    include exclude raffle easy everybody will participate by email.

![Screenshot](https://github.com/rogeriobispo/amigo_secreto/blob/master/public/Captura%20de%20tela%20de%202018-03-05%2010-52-45.png)

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




