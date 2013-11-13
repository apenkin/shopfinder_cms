ShopfinderCMS
==============

Simple rails engine. News and articles functionality for main app.

## Installation

In your app Gemfile
> gem 'shopfinder_cms', :github => "apenkin/shopfinder_cms"

Run 'bundle install'

Copy migrations to your application db/migrations
> rake shopfinder_cms:install:migrations

Apply migrations 
> rake db:migrate

Copy views to your application 
> rails g shopfinder_cms:views

Update your in views with your app’s design:
* views/layouts/shopfinder_cms.html.haml
* views/shopfinder_cms/*
