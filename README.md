<p align="center"><img width=40% src="https://i.imgur.com/Do9anPh.jpg?1"></p>

<p>
  <img align="center" src="https://img.shields.io/badge/PostgreSQL-12.1-336791">
  <img align="center" src="https://img.shields.io/badge/Ruby-2.6.1-CC342D">
  <img align="center" src="https://img.shields.io/badge/Ruby%20On%20Rails-6.0.1-cc0600">
</p>

# Contents
- [Overview](#overview)
  - [Description](#description)
  - [Features](#features)
  - [Challenges](#challenges)
  - [Technologies & Frameworks](#technologies-and-frameworks)
- [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Instructions](#instructions)
- [Credits](#credits)
- [License](#license)

&nbsp;

# Overview
  ### Description
  HTFML is a web forum designed to allow users to host discussions about various topics. Create an account and write posts about your favorite topics. Like, comment, and leave replies on your favorite posts.
  
  ### Features
  - View, search, and sort posts by categories
  - Create an account with log-in/log-out functionality 
  - Leave comments, replies, and like your favorite posts
  - View your activity on the user profile page
  - Change user account information
  
  ### Challenges
  - Rendering specific components based on presence of active session
    - Incorporated conditional rendering, using if/else statements, to account for active session 
  - Creating replies to associate to its respective comment
    - Created self-referential relationship between different instances of the `Comment` class as a `Reply`
  - Sorting posts based on categories
    - Through search params passed to the `Post` controller, filtered through all posts with the matching category and returning results
  
  ### Technologies and Frameworks
  - [jQuery](https://jquery.com/)
  - [Bootstrap](https://getbootstrap.com/)
  - [Ruby](https://www.ruby-lang.org/en/)
  - [Ruby on Rails](https://rubyonrails.org/)
  - [PostgreSQL](https://www.postgresql.org/)
  - [Active Model Serializer](https://github.com/rails-api/active_model_serializers)
  - [bcrypt](https://github.com/codahale/bcrypt-ruby)

&nbsp;
 
# Installation
  ### Prerequisites
  HTFML is built on Ruby, Ruby on Rails, and PostgreSQL. Make sure you have the latest versions of all four components installed before cloning this repo. You can find their official installation guides below:
  
  - [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
  - [Ruby On Rails](https://guides.rubyonrails.org/v5.0/getting_started.html)
  - [PostgreSQL](https://www.postgresqltutorial.com/)
  
### Instructions
  - Clone the most recent branch in this repository
  > Make sure you are in the project path before running the commands
  - Run `bundle install` in your bash-enabled terminal to make sure all dependancies are installed
  - Run `rails db:create` to create a local PostgreSQL database
  - Run `rails db:migrate` to create the schema for said database
  - Run `rails db:seed` to seed the database
  - Run `rails s` to start up a local server
  - Navigate to `localhost:3000` to launch the web application

&nbsp;

# Credits
  - [Emirhan Kaplan](https://github.com/emskaplann)

# License
<a href="https://github.com/jfeng530/HTFML-Forum/blob/master/LICENSE"><img alt="GitHub license" src="https://img.shields.io/github/license/jfeng530/nba_frontend?color=blue"></a>

Copyright 2019 © [Jacky Feng](https://github.com/jfeng530)
